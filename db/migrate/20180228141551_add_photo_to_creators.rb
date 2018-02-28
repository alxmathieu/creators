class AddPhotoToCreators < ActiveRecord::Migration[5.1]
  def change
    add_column :creators, :avatar_photo, :string
  end
end
