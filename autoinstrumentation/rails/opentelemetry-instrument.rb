require 'fileutils'
require 'yaml'

current_dir = File.expand_path(File.dirname(__FILE__))

gem_paths = YAML.load(File.read("#{current_dir}/manifest.yml")).map { |path| "#{current_dir}/#{path}" }

$LOAD_PATH.append(*gem_paths)

rails_path = ENV['_'] # Always absolute path
initializers_path = File.expand_path("#{File.dirname(rails_path)}/../config/initializers/")

if File.exists?(initializers_path)
  initializer_path = File.expand_path("#{__dir__}/__opentelemetry-rails-initializer.rb")
  FileUtils.copy(initializer_path, initializers_path)
end
