# Lolcommits Protonet

[![Gem](https://img.shields.io/gem/v/lolcommits-protonet.svg?style=flat)](http://rubygems.org/gems/lolcommits-protonet)
[![Travis](https://img.shields.io/travis/com/lolcommits/lolcommits-protonet/master.svg?style=flat)](https://travis-ci.com/lolcommits/lolcommits-protonet)
[![Depfu](https://img.shields.io/depfu/lolcommits/lolcommits-protonet.svg?style=flat)](https://depfu.com/github/lolcommits/lolcommits-protonet)
[![Maintainability](https://api.codeclimate.com/v1/badges/5754a7b62824fe86a9e4/maintainability)](https://codeclimate.com/github/lolcommits/lolcommits-protonet/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/5754a7b62824fe86a9e4/test_coverage)](https://codeclimate.com/github/lolcommits/lolcommits-protonet/test_coverage)

[lolcommits](https://lolcommits.github.io/) takes a snapshot with your
webcam every time you git commit code, and archives a lolcat style image
with it. Git blame has never been so much fun!

This plugin allows you to push lolcommits to your Protonet box. The
captured lolcommit is uploaded with a randomly generated message that
includes the commit sha and branch name.

You should follow the API documentation found on your box under
Help/"Protonet REST API" to get an API token.

## Requirements

* Ruby >= 2.4
* A webcam
* [ImageMagick](http://www.imagemagick.org)
* [ffmpeg](https://www.ffmpeg.org) (optional) for animated gif capturing
* A [Protonet](https://protonet.com) box

## Installation

After installing the lolcommits gem, install this plugin with:

    $ gem install lolcommits-protonet

Then configure to enable and set the api endpoint and token:

    $ lolcommits --config -p protonet
    # set enabled to `true`
    # set the api endpoint and token

That's it! To disable uninstall this gem or:

    $ lolcommits --config -p protonet
    # and set enabled to `false`

## Development

Check out this repo and run `bin/setup`, this will install all
dependencies and generate docs. Use `bundle exec rake` to run all tests
and generate a coverage report.

You can also run `bin/console` for an interactive prompt that will allow
you to experiment with the gem code.

## Tests

MiniTest is used for testing. Run the test suite with:

    $ rake test

## Docs

Generate docs for this gem with:

    $ rake rdoc

## Troubles?

If you think something is broken or missing, please raise a new
[issue](https://github.com/lolcommits/lolcommits-protonet/issues). Take
a moment to check it hasn't been raised in the past (and possibly
closed).

## Contributing

Bug [reports](https://github.com/lolcommits/lolcommits-protonet/issues)
and [pull
requests](https://github.com/lolcommits/lolcommits-protonet/pulls) are
welcome on GitHub.

When submitting pull requests, remember to add tests covering any new
behaviour, and ensure all tests are passing on [Travis
CI](https://travis-ci.com/lolcommits/lolcommits-protonet). Read the
[contributing
guidelines](https://github.com/lolcommits/lolcommits-protonet/blob/master/CONTRIBUTING.md)
for more details.

This project is intended to be a safe, welcoming space for
collaboration, and contributors are expected to adhere to the
[Contributor Covenant](http://contributor-covenant.org) code of conduct.
See
[here](https://github.com/lolcommits/lolcommits-protonet/blob/master/CODE_OF_CONDUCT.md)
for more details.

## License

The gem is available as open source under the terms of
[LGPL-3](https://opensource.org/licenses/LGPL-3.0).

## Links

* [Travis CI](https://travis-ci.com/lolcommits/lolcommits-protonet)
* [Code Climate](https://codeclimate.com/github/lolcommits/lolcommits-protonet/maintainability)
* [Test Coverage](https://codeclimate.com/github/lolcommits/lolcommits-protonet/test_coverage)
* [RDoc](http://rdoc.info/projects/lolcommits/lolcommits-protonet)
* [Issues](http://github.com/lolcommits/lolcommits-protonet/issues)
* [Report a bug](http://github.com/lolcommits/lolcommits-protonet/issues/new)
* [Gem](http://rubygems.org/gems/lolcommits-protonet)
* [GitHub](https://github.com/lolcommits/lolcommits-protonet)
