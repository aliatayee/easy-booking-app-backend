class AddPictureToRoomsTable < ActiveRecord::Migration[7.0]
  def change
    add_column :rooms, :picture, :string
  end
end
