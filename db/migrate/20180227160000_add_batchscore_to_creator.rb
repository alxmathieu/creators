class AddBatchscoreToCreator < ActiveRecord::Migration[5.1]
  def change
    add_column :creators, :batch_score, :integer
  end
end
