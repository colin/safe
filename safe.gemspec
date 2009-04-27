# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{safe}
  s.version = "0.1.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Astrails Ltd.", "Colin Schlueter"]
  s.date = %q{2009-04-27}
  s.default_executable = %q{astrails-safe}
  s.description = %q{Simple tool to backup MySQL databases and filesystem locally or to Amazon S3 (with optional encryption)}
  s.email = %q{we@astrails.com}
  s.executables = ["astrails-safe"]
  s.extra_rdoc_files = [
    "LICENSE",
    "README.markdown"
  ]
  s.files = [
    "LICENSE",
    "README.markdown",
    "Rakefile",
    "VERSION.yml",
    "bin/astrails-safe",
    "examples/example_helper.rb",
    "examples/unit/config_example.rb",
    "examples/unit/stream_example.rb",
    "lib/astrails/safe.rb",
    "lib/astrails/safe/archive.rb",
    "lib/astrails/safe/config/builder.rb",
    "lib/astrails/safe/config/node.rb",
    "lib/astrails/safe/gpg.rb",
    "lib/astrails/safe/gzip.rb",
    "lib/astrails/safe/local.rb",
    "lib/astrails/safe/mysqldump.rb",
    "lib/astrails/safe/pipe.rb",
    "lib/astrails/safe/s3.rb",
    "lib/astrails/safe/sink.rb",
    "lib/astrails/safe/source.rb",
    "lib/astrails/safe/stream.rb",
    "lib/astrails/safe/tmp_file.rb",
    "lib/extensions/mktmpdir.rb",
    "templates/script.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/astrails/safe}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{Backup filesystem and MySQL to Amazon S3 (with encryption)}
  s.test_files = [
    "examples/example_helper.rb",
    "examples/unit/config_example.rb",
    "examples/unit/stream_example.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<right_aws>, [">= 0"])
    else
      s.add_dependency(%q<right_aws>, [">= 0"])
    end
  else
    s.add_dependency(%q<right_aws>, [">= 0"])
  end
end
