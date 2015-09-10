class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.string :f_name
      t.string :l_name
      t.integer :mobile_number
      t.integer :age
      t.string :gender
      t.references :user

      t.timestamps
    end
  end
end
