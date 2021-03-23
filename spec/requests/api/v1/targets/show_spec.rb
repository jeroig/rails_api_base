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
    # let(:user2) { create(:user) }
    # let(:target2) { create(:target, user: user2, topic: topic) }
    it 'returns status 404 not found' do
      allow_any_instance_of(Api::V1::TargetsController).to receive(
        :current_user
      ).and_raise(ActiveRecord::RecordNotFound)
      subject
      # get api_v1_target_path(target2), headers: auth_headers, as: :json
      expect(response).to have_http_status(:not_found)
    end
  end
end
