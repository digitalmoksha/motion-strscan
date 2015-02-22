# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")

platform = ENV.fetch('platform', 'osx')
if platform == 'ios'
  require 'motion/project/template/ios'
elsif platform == 'osx'
  require 'motion/project/template/osx'
else
  raise "Unsupported platform #{ENV['platform']}"
end

require './lib/motion-strscan'

begin
  require 'bundler'
  require 'motion/project/template/gem/gem_tasks'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  app.name = 'motion-strscan'
end
