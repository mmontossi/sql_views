module SqlViews
  class << self

    def update
      pattern = Rails.root.join('db/views/*.sql')
      Dir.glob(pattern) do |path|
        path = Pathname.new(path)
        if changed?(path)
          name = path.basename('.sql')
          sql = File.read(path)
          puts "Updating #{name}"
          connection.execute "DROP VIEW IF EXISTS #{name}"
          connection.execute "CREATE VIEW #{name} AS \n #{sql}"
        end
      end
    end

    private

    def connection
      ActiveRecord::Base.connection
    end

    def changed?(path)
      basename = path.basename.to_s
      digest_path = digests_path.join(basename)
      current_digest = Digest::MD5.file(path).hexdigest
      if File.exist?(digest_path)
        last_digest = File.read(digest_path)
        if last_digest != current_digest
          update_digest digest_path, current_digest
          true
        else
          false
        end
      else
        update_digest digest_path, current_digest
        true
      end
    end

    def update_digest(path, value)
      FileUtils.mkdir_p path.dirname
      File.write path, value
    end

    def digests_path
      Rails.root.join 'tmp/digests/db/views'
    end

  end
end
