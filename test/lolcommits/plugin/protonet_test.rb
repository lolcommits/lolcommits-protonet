# frozen_string_literal: true

require "test_helper"
require 'webmock/minitest'

describe Lolcommits::Plugin::Protonet do
  include Lolcommits::TestHelpers::GitRepo
  include Lolcommits::TestHelpers::FakeIO

  describe "with a runner" do
    def runner
      # a simple lolcommits runner with an empty configuration Hash
      @runner ||= Lolcommits::Runner.new(
        lolcommit_path: Tempfile.new('lolcommit.jpg'),
      )
    end

    def plugin
      @plugin ||= Lolcommits::Plugin::Protonet.new(runner: runner)
    end

    def valid_enabled_config
      {
        enabled: true,
        api_endpoint: api_endpoint,
        api_token: "proto-token"
      }
    end

    def api_endpoint
      "https://yourbox.protonet.info/path"
    end

    describe "initalizing" do
      it "assigns runner and all plugin options" do
        plugin.runner.must_equal runner
        plugin.options.must_equal [:enabled, :api_endpoint, :api_token]
      end
    end

    describe "#enabled?" do
      it "is false by default" do
        plugin.enabled?.must_equal false
      end

      it "is true when configured" do
        plugin.configuration = valid_enabled_config
        plugin.enabled?.must_equal true
      end
    end

    describe "run_capture_ready" do
      before { commit_repo_with_message("first commit!") }
      after { teardown_repo }

      it "posts lolcommit with message to protonet box" do
        in_repo do
          plugin.configuration = valid_enabled_config

          stub_request(:post, api_endpoint).to_return(status: 200)

          plugin.run_capture_ready

          assert_requested :post, api_endpoint, times: 1,
            headers: {'Content-Type' => /multipart\/form-data/ } do |req|
            req.body.must_match(/Content-Disposition: form-data;.+name="files\[\]"; filename="lolcommit.jpg.+"/)
            req.body.must_match 'name="message"'
            req.body.must_match "plugin-test-repo"
          end
        end
      end

      it "returns nil if an error occurs" do
        in_repo do
          plugin.configuration = valid_enabled_config
          stub_request(:post, api_endpoint).to_return(status: 501)

          assert_nil plugin.run_capture_ready
        end
      end
    end

    describe "configuration" do
      it "allows plugin options to be configured" do
        # enabled, api endpoint, api token
        inputs = %W(true #{api_endpoint} proto-token)

        configured_plugin_options = {}

        fake_io_capture(inputs: inputs) do
          configured_plugin_options = plugin.configure_options!
        end

        configured_plugin_options.must_equal({
          enabled: true,
          api_endpoint: api_endpoint,
          api_token: inputs[2]
        })
      end
    end
  end
end
