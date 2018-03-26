ActiveAdmin.register Creator do

  permit_params :youtube_name, :description, :video_url, :nb_followers,
  :is_showcased, :country, :language, :user_id, :batch_id, :batch_score,
  :avatar_photo, :nb_videos

  index do
    selectable_column
    column :id
    column :youtube_name
    column :batch_id
    column :batch_score
    column :is_showcased
    column :user_id
    column :country
    column :language
    column :description
    column :created_at
    column :video_url
    actions
  end
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
