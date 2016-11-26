require 'rails/generators'

module Views
  module Generators
    class ViewGenerator < Rails::Generators::NamedBase
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      def create_view_file
        template 'view.sql', "db/views/#{table_name}.sql"
      end

      def create_migration_file
        migration_template 'migration.rb', "db/migrate/create_#{table_name}_view.rb"
      end

      def self.next_migration_number(path)
        Time.now.utc.strftime '%Y%m%d%H%M%S'
      end

    end
  end
end
