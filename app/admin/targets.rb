ActiveAdmin.register Target do
  decorate_with TargetDecorator
  permit_params :user_id, :topic_id, :title, :latitude, :longitude, :radius

  actions :all, except: %i[new edit destroy]

  includes :user, :topic

  index do
    selectable_column
    id_column
    column :user
    column :topic
    column :title
    column :latitude
    column :longitude
    column :radius
    column :created_at
    column :updated_at

    actions
  end

  filter :id
  filter :user
  filter :topic
  filter :title
  filter :latitude
  filter :longitude
  filter :radius
  filter :created_at
  filter :updated_at

  show do
    attributes_table do
      row :id
      row :user
      row :topic
      row :title
      row :latitude
      row :longitude
      row :radius
      row :created_at
      row :updated_at
    end
  end
end
