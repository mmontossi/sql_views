module Views
  class Railtie < Rails::Railtie

    initializer 'views.active_record' do
      ActiveSupport.on_load :active_record do
        ::ActiveRecord::Migration::CommandRecorder.include(
          Views::Extensions::ActiveRecord::CommandRecorder
        )
        ::ActiveRecord::ConnectionAdapters::AbstractAdapter.include(
          Views::Extensions::ActiveRecord::AbstractAdapter
        )
        ::ActiveRecord::SchemaDumper.prepend(
          Views::Extensions::ActiveRecord::SchemaDumper
        )
      end
    end

  end
end
