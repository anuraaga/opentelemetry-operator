require 'yaml'

gem_home = ENV['GEM_HOME']
gem_paths = $LOAD_PATH.filter { |path| path.start_with?(gem_home) }.map { |path| path.delete_prefix("#{Dir.pwd}/") }

File.open('manifest.yml', 'w') do |file|
  file.write(gem_paths.to_yaml)
end
