ActiveAdmin.register User do

  permit_params :username, :avatar, :nb_following, :level, :bio, :admin, :location

  index do
    selectable_column
    column :id
    column :username
    column :email
    column :level
    column :created_at
    column :admin
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
