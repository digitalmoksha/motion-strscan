unless defined?(Motion::Project::Config)
  raise 'The motion-strscan gem must be required within a RubyMotion project Rakefile.'
end

lib_dir_path = File.dirname(File.expand_path(__FILE__))
Motion::Project::App.setup do |app|
  app.files.unshift(Dir.glob(File.join(lib_dir_path, "motion-strscan/**/*.rb")))
end
