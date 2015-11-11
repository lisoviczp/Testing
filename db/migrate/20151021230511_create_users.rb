class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :artist_type
      t.string :city
      t.attachment :image
      t.string :description

      t.timestamps null: false
    end
  end
end
