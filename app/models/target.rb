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
class Target < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  validate :target_limit, on: :create
  reverse_geocoded_by :latitude, :longitude

  def linked_targets
    Target.where.not(user_id: user_id).where(topic_id: topic_id).select do |target|
      distance_to(target) <= (radius + target.radius)
    end
  end

  private

  def target_limit
    errors.add :target_limit, 'You already have 10 targets' if user.targets.reload.count >= 10
  end
end
