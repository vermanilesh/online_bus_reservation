class AddAvatarToBuses < ActiveRecord::Migration
  def change
    add_column :buses, :avatar, :string
  end
end
