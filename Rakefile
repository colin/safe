require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "safe"
    gem.summary = %Q{Backup filesystem and MySQL to Amazon S3 (with encryption)}
    gem.description = "Simple tool to backup MySQL databases and filesystem locally or to Amazon S3 (with optional encryption)"
    gem.email = "we@astrails.com"
    gem.homepage = "http://github.com/astrails/safe"
    gem.authors  = ["Astrails Ltd.", "Colin Schlueter"]
    gem.files = FileList["[A-Z]*.*", "{bin,examples,generators,lib,rails,spec,test,templates}/**/*", 'Rakefile', 'LICENSE*']

    gem.add_dependency("right_aws")

    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

require 'micronaut/rake_task'
Micronaut::RakeTask.new(:examples) do |examples|
  examples.pattern = 'examples/**/*_example.rb'
  examples.ruby_opts << '-Ilib -Iexamples'
end

Micronaut::RakeTask.new(:rcov) do |examples|
  examples.pattern = 'examples/**/*_example.rb'
  examples.rcov_opts = '-Ilib -Iexamples'
  examples.rcov = true
end


task :default => :examples

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  if File.exist?('VERSION.yml')
    config = YAML.load(File.read('VERSION.yml'))
    version = "#{config[:major]}.#{config[:minor]}.#{config[:patch]}"
  else
    version = ""
  end

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "safe #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

