module Views
  class Railtie < Rails::Railtie

    initializer 'views.extensions' do
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
