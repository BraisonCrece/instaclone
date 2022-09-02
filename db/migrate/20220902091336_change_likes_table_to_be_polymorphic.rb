class ChangeLikesTableToBePolymorphic < ActiveRecord::Migration[7.0]
  def change
    change_table :likes do |table|
      table.remove :post_id
      table.references :likeable, polymorphic: true, null: false
    end
  end
end
