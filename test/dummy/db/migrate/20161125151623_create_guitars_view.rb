class CreateGuitarsView < ActiveRecord::Migration[5.1]
  def change
    create_view :guitars
  end
end
