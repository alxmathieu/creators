class AddChannelIdToCreators < ActiveRecord::Migration[5.1]
  def change
    add_column :creators, :channel_id, :string
  end
end
