describe 'GET api/v1/topic', type: :request do
  let(:user) { create(:user) }
  let(:qt_topics) { rand(1..3) }

  subject { get api_v1_topics_path, headers: auth_headers, as: :json }

  it 'returns success' do
    subject
    expect(response).to have_http_status(:success)
  end

  it 'list all topic existing in DataBase' do
    1.upto(qt_topics) { create(:topic).save! }
    subject
    expect(JSON.parse(response.body).size).to eq(qt_topics)
  end
end
