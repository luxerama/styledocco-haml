# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "styledocco-haml"
  s.version     = "0.0.1"
  s.authors     = ["Ad Taylor", "Jacob Rask", "Mike Brevoort",]
  s.email       = ["developers@thebeansgroup.com"]
  s.homepage    = "https://github.com/thebeansgroup/styledocco-haml"
  s.summary     = %q{Use styledocco-haml with Rails 3.1}
  s.description = %q{Style guide for The Beans Group}

  s.rubyforge_project = "styledocco-haml"

  s.add_development_dependency "bundler", ">= 1.0.0"
  s.add_development_dependency "rails",   ">= 3.1.0"

  s.files         = `git ls-files`.split("\n")
  #s.test_files    = `git ls-files -- {spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- script/*`.split("\n").map{ |f| File.basename(f) }
  #s.require_paths = ["lib"]
end
