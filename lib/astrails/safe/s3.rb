module Astrails
  module Safe
    class S3 < Sink

      protected

      def active?
        bucket && key && secret
      end

      def prefix
        @prefix ||= expand(config[:s3, :path] || expand(config[:local, :path] || ":kind/:id"))
      end

      def base
        @base ||= File.basename(filename).split(".").first
      end

      def save
        file = @parent.open
        puts "Uploading #{bucket}:#{path}" if $_VERBOSE || $DRY_RUN
        unless $DRY_RUN || $LOCAL
          s3.create_bucket(bucket)
          s3.put(bucket, path, file)
          puts "...done" if $_VERBOSE
        end
        file.close if file
      end

      def cleanup
        return if $LOCAL
        return unless keep = @config[:keep, :s3]

        puts "listing files in #{bucket}:#{prefix}/#{base}"
        files = s3.list_bucket(bucket, { 'prefix' => "#{prefix}/#{base}", 'max-keys' => keep * 2 })
        puts files.collect {|x| x[:key]} if $_VERBOSE

        files = files.collect {|x| x[:key]}.sort

        cleanup_with_limit(files, keep) do |f|
          puts "removing s3 file #{bucket}:#{f}" if $DRY_RUN || $_VERBOSE
          s3.delete(bucket, f) unless $DRY_RUN || $LOCAL
        end
      end

      def bucket
        config[:s3, :bucket]
      end

      def key
        config[:s3, :key]
      end

      def secret
        config[:s3, :secret]
      end

      def s3
        @s3 ||= RightAws::S3Interface.new(key, secret)
      end

    end
  end
end
