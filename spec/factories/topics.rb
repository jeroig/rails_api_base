# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_topics_on_name  (name) UNIQUE
#
FactoryBot.define do
  factory :topic do
    name { Faker::Name.unique.name }
    after(:build) do |topic|
      topic.image.attach(
        io: File.open(Rails.root.join('spec', 'factories', 'images',
                                      'topic_image.jpeg')),
        filename: 'topic_image.jpeg',
        content_type: 'image/jpeg'
      )
    end
  end
end
