module Views
  module Extensions
    module ActiveRecord
      module AbstractAdapter
        extend ActiveSupport::Concern

        def initialize(*args)
          if adapter_name == 'PostgreSQL'
            self.class.include Views::Extensions::ActiveRecord::PostgreSQLAdapter
          end
          super
        end

      end
    end
  end
end
