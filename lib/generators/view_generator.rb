require 'rails/generators'

module Views
  module Generators
    class ViewGenerator < Rails::Generators::NamedBase

      source_root File.expand_path('../templates', __FILE__)

      def create_fixture_file
        template 'view.sql', "db/views/#{table_name}.sql"
      end

    end
  end
end
