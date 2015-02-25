# -*- encoding: utf-8 -*-
require File.expand_path('../lib/motion-strscan/version.rb', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = "motion-strscan"
  gem.version       = MotionStrscan::VERSION
  gem.authors       = ['Brett Walker']
  gem.email         = ['github@digitalmoksha.com']
  gem.description   = %q{StringScanner implementation for RubyMotion}
  gem.summary       = %q{A StringScanner implementation for RubyMotion}
  gem.homepage      = 'https://github.com/digitalmoksha/motion-strscan'
  gem.licenses      = ['MIT']

  gem.files         = Dir.glob('lib/**/*.rb')
  gem.files        << 'README.md'
  gem.test_files    = Dir.glob('spec/**/*.rb')
  gem.require_paths = ['lib']
end
