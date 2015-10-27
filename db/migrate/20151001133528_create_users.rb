class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :age
      t.string :home_state
      t.string :home_zip
      t.string :home_city
      t.text :bio
      t.string :profile_pic
      t.string :phone
      t.string   "password_digest"
      t.string   "remember_digest"

      t.timestamps null: false
    end
  end
end
