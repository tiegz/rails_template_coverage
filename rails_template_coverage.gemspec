# -*- encoding: utf-8 -*-
require File.expand_path("../lib/rails_template_coverage/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "rails_template_coverage"
  s.version     = RailsTemplateCoverage::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Tieg Zaharia"]
  s.email       = ["tieg.zaharia@gmail.com"]
  s.homepage    = "http://rubygems.org/gems/rails_template_coverage"
  s.summary     = "Check rails template coverage"
  s.description = "Check rails template coverage in functional test suite"

  s.add_dependency "activerecord", "~> 3.2"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end

