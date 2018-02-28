class AddPhotoDefault < ActiveRecord::Migration[5.1]
  def change
    change_column_default :users, :avatar, "http://res.cloudinary.com/benoitprigent/image/upload/v1519828592/default-avatar.png"
    change_column_default :creators, :avatar_photo, "http://res.cloudinary.com/benoitprigent/image/upload/v1519828592/default-avatar.png"
  end
end
