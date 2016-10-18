require 'rails/generators/named_base'

module Views
  module Generators
    class ViewGenerator < Rails::Generators::NamedBase

      source_root File.expand_path('../templates', __FILE__)

      def create_fixture_file
        template 'view.sql', Rails.root.join("db/views/#{table_name}.sql")
      end

    end
  end
end
