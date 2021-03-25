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
describe Target do
  describe 'validations' do
    context 'when create a target' do
      let(:user)  { create(:user) }
      let(:topic) { create(:topic) }
      it 'test' do
        10.times { create(:target, user: user, topic: topic) }
        new_target = build(:target, user: user, topic: topic)
        expect(new_target).to be_invalid
        expect(new_target.errors[:target_limit]).to include('You already have 10 targets')
      end
    end
  end
end
