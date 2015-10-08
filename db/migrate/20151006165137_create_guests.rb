class CreateGuests < ActiveRecord::Migration
  def change
    create_table :guests do |t|
      t.belongs_to :post
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
