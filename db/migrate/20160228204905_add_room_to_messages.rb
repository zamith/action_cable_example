class AddRoomToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :room, :string
    add_index :messages, :room
  end
end
