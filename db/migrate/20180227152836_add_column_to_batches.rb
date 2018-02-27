class AddColumnToBatches < ActiveRecord::Migration[5.1]
  def change
    add_column :batches, :number, :integer
  end
end
