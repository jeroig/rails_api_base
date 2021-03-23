# == Schema Information
#
# Table name: targets
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  topic_id   :bigint           not null
#  title      :string
#  address    :string
#  latitude   :float
#  longitude  :float
#  radius     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_targets_on_topic_id  (topic_id)
#  index_targets_on_user_id   (user_id)
#
FactoryBot.define do
  factory :target do
    # user { nil }
    # topic { nil }
    title { Faker::Name.unique.name }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    radius { Faker::Number.between(from: 1, to: 40) }
  end
end
