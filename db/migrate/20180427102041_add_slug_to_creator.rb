class AddSlugToCreator < ActiveRecord::Migration[5.1]
  def change
    add_column :creators, :slug, :string
    add_index :creators, :slug, unique: true
  end
end
