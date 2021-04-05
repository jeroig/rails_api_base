describe 'GET api/v1/targets/:id', type: :request do
  let(:user) { create(:user) }
  let(:topic) { create(:topic) }
  let(:target) { create(:target, user: user, topic: topic) }

  subject { get api_v1_target_path(target), headers: auth_headers, as: :json }

  it 'returns success' do
    subject
    expect(response).to have_http_status(:success)
  end

  it 'return a user target' do
    subject
    expect(json[:id]).to eq(target.id)
    expect(json[:user_id]).to eq(user.id)
    expect(json[:topic_id]).to eq(topic.id)
  end

  context 'when record is not found' do
    let(:other_user) { create(:user) }
    let(:other_target) { create(:target, user: other_user, topic: topic) }
    it 'returns status 404 not found' do
      get api_v1_target_path(other_target), headers: auth_headers, as: :json
      expect(response).to have_http_status(:not_found)
    end
  end
end
