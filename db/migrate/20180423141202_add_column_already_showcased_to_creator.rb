class AddColumnAlreadyShowcasedToCreator < ActiveRecord::Migration[5.1]
  def change
    add_column :creators, :already_showcased, :boolean, default: false
  end
end
