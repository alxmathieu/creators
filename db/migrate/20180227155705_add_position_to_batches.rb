class AddPositionToBatches < ActiveRecord::Migration[5.1]
  def change
    add_column :batches, :first_creator_id, :integer
    add_column :batches, :second_creator_id, :integer
    add_column :batches, :third_creator_id, :integer
  end
end
