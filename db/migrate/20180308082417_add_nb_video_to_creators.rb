class AddNbVideoToCreators < ActiveRecord::Migration[5.1]
  def change
    add_column :creators, :nb_videos, :integer
  end
end
