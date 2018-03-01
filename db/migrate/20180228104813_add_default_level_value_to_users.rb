class AddDefaultLevelValueToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :level, 0
  end
end
