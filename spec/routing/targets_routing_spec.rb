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
describe Api::V1::TargetsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/targets').to route_to('api/v1/targets#index', format: :json)
    end

    it 'routes to #show' do
      expect(get: '/api/v1/targets/1').to route_to('api/v1/targets#show', id: '1', format: :json)
    end

    it 'routes to #create' do
      expect(post: '/api/v1/targets').to route_to('api/v1/targets#create', format: :json)
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v1/targets/1').to route_to('api/v1/targets#destroy', id: '1',
                                                                                format: :json)
    end
  end
end
