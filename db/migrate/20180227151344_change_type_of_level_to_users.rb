class ChangeTypeOfLevelToUsers < ActiveRecord::Migration[5.1]
  def change
      change_column :users, :level,
        'integer USING CAST(level AS integer)'
  end
end
