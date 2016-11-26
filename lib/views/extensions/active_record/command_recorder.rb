module Views
  module Extensions
    module ActiveRecord
      module CommandRecorder
        extend ActiveSupport::Concern

        def create_view(args)
          record :create_view, args
        end

        def change_view(args)
          record :change_view, args
        end

        def drop_view(args)
          record :drop_view, args
        end

        def invert_create_view(args)
          [:drop_view, args]
        end

      end
    end
  end
end
