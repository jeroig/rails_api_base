describe 'GET api/v1/target', type: :request do
  let(:user)        { create(:user) }
  let(:other_user)  { create(:user) }
  let(:topic)       { create(:topic) }
  let(:all_targets) { 5 }
  let(:my_targets)  { rand(1..3) }

  subject { get api_v1_targets_path, headers: auth_headers, as: :json }

  it 'returns success' do
    subject
    expect(response).to have_http_status(:success)
  end

  it 'list my targets' do
    1.upto(my_targets) { create(:target, user: user, topic: topic) }
    (my_targets + 1).upto(all_targets) { create(:target, user: other_user, topic: topic) }
    subject
    expect(JSON.parse(response.body).size).to eq(my_targets)
  end
end
