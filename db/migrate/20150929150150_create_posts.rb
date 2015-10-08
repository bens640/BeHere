class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user
      t.string :header
      t.date :date
      t.string :time
      t.string :guests, array: true, default: []
      t.string :location
      t.string :city
      t.string :full_address
      t.boolean :over21, default: false
      t.boolean :private, default: false
      t.string :event_type


      t.timestamps null: false
    end
  end
end
