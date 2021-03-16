ActiveAdmin.register Topic do
  decorate_with TopicDecorator

  permit_params :name, :image
  # or
  #
  # permit_params do
  #   permitted = [:name]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  # Documentation to support and ActiveStorage field in ActiveAdmin
  # https://medium.com/@maris.cilitis/using-ruby-on-rails-active-storage-image-uploads-for-active-admin-backed-resources-5638a9ca0b46
  form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :image, as: :file,
                      hint: f.object.image.attached? ? image_tag(f.object.image.variant(resize: '100x100')) : ''
      # f.file_field :image, as: :file
    end
    actions
  end

  index do
    selectable_column
    id_column
    column :name
    column :image do |ad|
      # image_tag url_for(ad.image) if ad.image.attached?
      image_tag ad.image.variant(resize: '100x100') if ad.image.attached?
    end
    column :created_at
    column :updated_at

    actions
  end

  show do
    attributes_table do
      row :name
      row :image do |ad|
        # image_tag url_for(ad.image) if ad.image.attached?
        image_tag ad.image.variant(resize: '100x100') if ad.image.attached?
      end
    end
  end
end
