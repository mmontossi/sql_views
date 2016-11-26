class CreateGuitarsView < ActiveRecord::Migration
  def change
    create_view :guitars
  end
end
