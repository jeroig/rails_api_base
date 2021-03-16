describe 'GET api/v1/topic', type: :request do
  let(:user) { create(:user) }
  let(:one_topic) { create(:topic) }
  let(:two_topic) { create(:topic) }

  subject { get api_v1_topics_path, headers: auth_headers, as: :json }

  it 'returns success' do
    subject
    expect(response).to have_http_status(:success)
  end

  it 'list all topic existing in DataBase' do
    one_topic.save
    two_topic.save
    subject
    expect(JSON.parse(response.body).size).to eq(2)
  end
end
