class AddAcceptedToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :accepted, :boolean
  end
end
