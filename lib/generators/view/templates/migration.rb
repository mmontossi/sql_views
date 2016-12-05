class <%= migration_class_name %> < ActiveRecord::Migration
  def change
    create_view :<%= table_name %>
  end
end
