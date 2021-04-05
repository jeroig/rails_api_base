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
describe Topic do
  describe 'validations' do
    # subject { build :topic }
    context 'when create a topic' do
      it { is_expected.to validate_uniqueness_of(:name) }
      it { is_expected.to validate_presence_of(:name) }
    end
  end

  describe 'attach image' do
    let(:topic) { create(:topic) }
    it { expect(topic.image).to be_attached }
  end
end
