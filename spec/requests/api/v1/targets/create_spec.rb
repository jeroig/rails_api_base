describe 'POST api/v1/targets/', type: :request do
  let(:user) { create(:user) }

  describe 'POST create' do
    let(:topic)     { create(:topic) }
    let(:title)     { 'Title Target' }
    let(:latitude)  { -34.1917 }
    let(:longitude) { -61.5334 }
    let(:radius)    { 5 }

    let(:params) do
      {
        target: {
          topic_id: topic.id,
          title: title,
          latitude: latitude,
          longitude: longitude,
          radius: radius
        }
      }
    end

    it 'returns a successful response' do
      post api_v1_targets_path, headers: auth_headers, params: params, as: :json

      expect(response).to have_http_status(:success)
    end

    it 'create the target' do
      expect {
        post api_v1_targets_path, headers: auth_headers, params: params, as: :json
      }.to change(Topic, :count).by(1)
    end

    it 'returns the target' do
      post api_v1_targets_path, headers: auth_headers, params: params, as: :json
      expect(json[:user_id]).to eq(user.id)
      expect(json[:topic_id]).to eq(topic.id)
      expect(json[:title]).to eq(title)
      expect(json[:latitude]).to eq(latitude)
      expect(json[:longitude]).to eq(longitude)
      expect(json[:radius]).to eq(radius)
    end

    it 'can\'t create more than 10 targets per user' do
      10.times { create(:target, user: user, topic: topic) }
      post api_v1_targets_path, headers: auth_headers, params: params, as: :json
      expect(response).to have_http_status(:unprocessable_entity)
      # expect(json[:error]).to include('there are already 10 targets')
    end
  end
end
