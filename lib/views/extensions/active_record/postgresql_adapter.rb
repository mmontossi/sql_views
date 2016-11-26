module Views
  module Extensions
    module ActiveRecord
      module PostgreSQLAdapter
        extend ActiveSupport::Concern

        def create_view(name, options={})
          if options[:force]
            execute "DROP VIEW IF EXISTS #{name}"
          end
          path = Rails.root.join("db/views/#{name}.sql")
          definition = File.read(path)
          execute "CREATE VIEW #{name} AS #{definition}"
        end

        def change_view(name, options={})
          drop_view name
          create_view name, options
        end

        def drop_view(name)
          execute "DROP VIEW #{name}"
        end

        def views
          execute <<-SQL
            SELECT c.relname as name, c.relkind AS type
            FROM pg_class c
            LEFT JOIN pg_namespace n ON n.oid = c.relnamespace
            WHERE c.relkind IN ('v')
            AND n.nspname = ANY (current_schemas(false))
            ORDER BY c.oid ASC
          SQL
        end

      end
    end
  end
end
