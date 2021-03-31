describe 'GET api/v1/targets/:id/linked', type: :request do
  let(:user)        { create(:user) }
  let(:other_user)  { create(:user) }
  let(:topic)       { create(:topic) }
  let(:target)      do
    create(:target, user: user, topic: topic, latitude: 1, longitude: 1, radius: 5)
  end
  # let(:other_target) do
  #   create(:target, user: other_user, topic: topic, latitude: 1, longitude: 1, radius: 5)
  # end

  subject { get api_v1_targets_linked_path(target), headers: auth_headers, as: :json }

  it 'returns success' do
    subject
    expect(response).to have_http_status(:success)
  end

  it 'return linked target' do
    create(:target, user: other_user, topic: topic, latitude: 1, longitude: 1, radius: 5)
    subject
    expect(JSON.parse(response.body).size).to eq(1)
  end

  it 'return empty target' do
    create(:target, user: other_user, topic: topic, latitude: 10, longitude: 10, radius: 1)
    subject
    expect(JSON.parse(response.body).size).to eq(0)
  end
end
