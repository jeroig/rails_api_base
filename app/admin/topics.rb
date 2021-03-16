ActiveAdmin.register Topic do
  decorate_with TopicDecorator

  permit_params :name
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  index do
    selectable_column
    id_column
    column :name
    column :created_at
    column :updated_at

    actions
  end
end
