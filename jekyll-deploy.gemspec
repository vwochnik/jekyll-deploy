# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/deploy/version'

Gem::Specification.new do |spec|
  spec.name          = "jekyll-deploy"
  spec.version       = Jekyll::Deploy::VERSION
  spec.authors       = ["Vincent Wochnik"]
  spec.email         = ["v.wochnik@gmail.com"]
  spec.description   = %q{Jekyll 3.0-compatible deploy plugin}
  spec.summary       = %q{This plugin provides a simple jekyll command for deploying your static site.}
  spec.homepage      = "https://github.com/vwochnik/jekyll-deploy"
  spec.license       = "MIT"

  spec.files         = [*Dir["lib/**/*.rb"], "README.md", "LICENSE.md"]
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 1.9.3'
  spec.add_development_dependency 'jekyll', '~> 3.0'
end
