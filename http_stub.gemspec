# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "http_stub/version"

Gem::Specification.new do |s|
  s.name = "http_stub"
  s.version = HttpStub::VERSION
  s.platform = Gem::Platform::RUBY
  s.authors = ["Matthew Ueckerman", "Russell Van Bert"]
  s.summary = %q{A HTTP Server replaying configured stub responses.}
  s.description = %q{fakeweb for a HTTP server, informing it to stub / fake responses.}
  s.email = %q{matthew.ueckerman@myob.com}
  s.homepage = "http://github.com/MYOB-Technology/http_stub"
  s.rubyforge_project = "http_stub"
  s.license = "MIT"

  s.files        = Dir.glob("./lib/**/*")
  s.test_files   = Dir.glob("./spec/**/*")

  s.require_path = "lib"

  s.required_ruby_version = ">= 1.9.3"

  s.add_dependency "sinatra", "~> 1.4"
  s.add_dependency "sinatra-partial", "~> 0.4"
  s.add_dependency "haml", "~> 4.0"
  s.add_dependency "sass", "~> 3.2"
  s.add_dependency "rake", "~> 10.1"

  s.add_development_dependency "travis-lint", "~> 1.7"
  s.add_development_dependency "metric_fu", "~> 4.4"
  s.add_development_dependency "rspec", "~> 2.14"
  s.add_development_dependency "simplecov", "~> 0.7"
  s.add_development_dependency "rake", "~> 10.1"
  s.add_development_dependency "rack-test", "~> 0.6"
  s.add_development_dependency "nokogiri", "~> 1.6"
  s.add_development_dependency "httparty", "~> 0.12"
  s.add_development_dependency "wait_until", "~> 0.0.1"
  s.add_development_dependency "json", "~> 1.8"
end
