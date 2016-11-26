module Views
  module Extensions
    module ActiveRecord
      module SchemaDumper
        extend ActiveSupport::Concern

        def dump(stream)
          header(stream)
          extensions(stream)
          tables(stream)
          views(stream)
          trailer(stream)
          stream
        end

        def views(stream)
          @connection.views.map(&:values).each do |name, type|
            stream.puts <<-SCHEMA.strip_heredoc.indent(2)
              create_view "#{name}", force: true
            SCHEMA
          end
          stream.puts "\n"
        end

      end
    end
  end
end
