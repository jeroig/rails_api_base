json.extract! topic, :id, :name, :created_at, :updated_at
json.image polymorphic_url(topic.image) if topic.image.attached?
