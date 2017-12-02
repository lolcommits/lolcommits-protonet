require 'rest_client'
require 'lolcommits/plugin/base'

module Lolcommits
  module Plugin
    class Protonet < Base

      ##
      # Initialize plugin with runner, config and set all configurable options.
      #
      def initialize(runner: nil, config: nil)
        super
        options.concat(plugin_options)
      end

      ##
      # Returns the name of the plugin to identify the plugin to lolcommits.
      #
      # @return [String] the plugin name
      #
      def self.name
        'protonet'
      end

      ##
      # Returns position(s) of when this plugin should run during the capture
      # process. Posting to a Protonet box happens when a new capture is ready.
      #
      # @return [Array] the position(s) (:capture_ready)
      #
      def self.runner_order
        [:capture_ready]
      end

      ##
      # Prompts the user to configure plugin options.
      #
      # @return [Hash] a hash of configured plugin options
      #
      def configure_options!
        puts "-----------------------------------------------------------------"
        puts "              Lolcommits Protonet Plugin Config"
        puts "-----------------------------------------------------------------"
        puts "\n"
        puts "We'll need an API endpoint & token. Find API info on your box at "
        puts "Help/Protonet Rest API. Visit https://protonet.com for more info."
        puts "-----------------------------------------------------------------"
        puts "\n"
        super
      end

      ##
      # Returns true if the plugin has been configured.
      #
      # @return [Boolean] true/false indicating if plugin is configured. An API
      # token and endpoint are required.
      #
      def configured?
        !!(configuration['enabled'] &&
           configuration['api_token'] &&
           configuration['api_endpoint'])
      end

      ##
      # Post-capture hook, runs after lolcommits captures a snapshot. Posts the
      # lolcommit image with a message to the Protonet box. API Documentation
      # can be found on the Protonet box under Help/"Protonet REST API"
      #
      # @return [RestClient::Response] response object from POST request
      # @return [Nil] if any error occurs
      #
      def run_capture_ready
        debug "Posting image (and message) to #{configuration['api_endpoint']}"
        RestClient.post(
          configuration['api_endpoint'],
          {
            files: [File.new(runner.main_image)],
            message: message
          },
          'X-Protonet-Token' => configuration['api_token']
        )
      rescue => e
        log_error(e, "ERROR: RestClient POST FAILED #{e.class} - #{e.message}")
        nil
      end


      private

      ##
      # Returns a randomly generated message describing the lolcommit, with repo
      # info, commit sha and branch name.
      #
      # @return [String]
      #
      def message
        "commited some #{random_adjective} #{random_noun} to #{runner.vcs_info.repo}@#{runner.sha} (#{runner.vcs_info.branch})"
      end

      ##
      # Returns a randomly chosen noun to describe the lolcommit.
      #
      # @return [String]
      #
      def random_noun
        %w(screws bolts exceptions errors cookies).sample
      end

      ##
      # Returns a randomly chosen adjective to describe the lolcommit.
      #
      # @return [String]
      #
      def random_adjective
        [
          'awesome', 'great', 'interesting', 'cool', 'EPIC', 'gut', 'good', 'pansy',
          'powerful', 'boring', 'quirky', 'untested', 'german', 'iranian', 'neutral', 'crazy', 'well tested',
          'jimmy style', 'nasty', 'bibliographical (we received complaints about the original wording)',
          'bombdiggidy', 'narly', 'spiffy', 'smashing', 'xing style',
          'leo apotheker style', 'black', 'white', 'yellow', 'shaggy', 'tasty', 'mind bending', 'JAY-Z',
          'Kanye (the best ever)', '* Toby Keith was here *', 'splendid', 'stupendulous',
          '(freedom fries!)', '[vote RON PAUL]', '- these are not my glasses -', 'typical pansy',
          '- ze goggles zey do nothing! -', 'almost working', 'legen- wait for it -', '-dairy!',
          ' - Tavonius would be proud of this - ', 'Meg FAILMAN!', '- very brofessional of you -',
          'heartbleeding', 'juciy', 'supercalifragilisticexpialidocious', 'failing', 'loving'
        ].sample
      end

      ##
      # Returns all configuration options available for this plugin. An API
      # endpoint and token.
      #
      # @return [Array] the option names
      #
      def plugin_options
        %w(api_endpoint api_token)
      end
    end
  end
end
