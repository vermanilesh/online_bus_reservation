class ChangeFareTypeInSchedules < ActiveRecord::Migration
  def change
  	change_column :schedules, :fare, :float
  end
end
