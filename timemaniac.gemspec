# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "timemaniac/version"

Gem::Specification.new do |s|
  s.name        = "timemaniac"
  s.version     = Timemaniac::VERSION
  s.authors     = ["Benjamin Grandfond"]
  s.email       = ["benjamin.grandfond@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Track the time you spend doing stuff.}
  s.description = %q{Create, list, start, pause your task and see how long you spend on it.}

  s.rubyforge_project = "timemaniac"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec", "~> 2.7.0"
  s.add_development_dependency "simplecov", "~> 0.5.4"
  s.add_runtime_dependency "OptionParser", "~> 0.5.1"
end