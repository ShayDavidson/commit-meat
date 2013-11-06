# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "commit-meat/version"

Gem::Specification.new do |s|
  s.name        = 'commit-meat'
  s.version     = CommitMeat::VERSION
  s.summary     = %q{Tells you when your commit are bad.}
  s.description = %q{Installs a pre-commit hook that tells you when your commit messages are too short or uninformative.}
  s.authors     = ['Shay Davidson']
  s.email       = ['shay.h.davidson@gmail.com']
  s.files       = ['lib/commit-meat.rb']
  s.homepage    = 'https://github.com/iic-ninjas/commit-meat'
  s.license     = 'MIT'

  s.files         = `git ls-files`.split("\n") - ["Gemfile.lock"]
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'colored'
  s.add_runtime_dependency 'choice'
end