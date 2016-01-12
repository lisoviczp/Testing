class CreateFavoriteEstablishments < ActiveRecord::Migration
  def change
    create_table :favorite_establishments do |t|
      t.integer :establishment_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
