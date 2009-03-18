Gem::Specification.new do |s|
  s.name     = "safe"
  s.version  = "0.1.1"
  s.date     = "2009-03-15"
  s.summary  = "Astrails Safe"
  s.email    = "we@astrails.com"
  s.homepage = "http://github.com/astrails/safe"
  s.description = "Simple tool to backup MySQL databases and filesystem locally or to Amazon S3 (with optional encryption)"
  s.has_rdoc = false
  s.authors  = ["Astrails Ltd."]
  s.files    = files = %w(
  README
  bin/astrails-safe
  lib/extensions/mktmpdir.rb
  lib/astrails/safe.rb
  lib/astrails/safe/s3.rb
  lib/astrails/safe/gpg.rb
  lib/astrails/safe/mysqldump.rb
  lib/astrails/safe/stream.rb
  lib/astrails/safe/config/builder.rb
  lib/astrails/safe/config/node.rb
  lib/astrails/safe/sink.rb
  lib/astrails/safe/pipe.rb
  lib/astrails/safe/source.rb
  lib/astrails/safe/archive.rb
  lib/astrails/safe/local.rb
  lib/astrails/safe/tmp_file.rb
  lib/astrails/safe/gzip.rb
  templates/script.rb
  safe.gemspec
  )
  s.executables = files.grep(/^bin/).map {|x| x.gsub(/^bin\//, "")}

  s.test_files = []
  s.add_dependency("aws-s3")
end

