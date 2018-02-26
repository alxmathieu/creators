class AddStuffToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string
    add_column :users, :avatar, :string
    add_column :users, :channel_url, :string
    add_column :users, :nb_following, :integer
    add_column :users, :level, :string
  end
end
