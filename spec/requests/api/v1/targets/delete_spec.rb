describe 'DELETE api/v1/targets/:id', type: :request do
  let(:user) { create(:user) }
  let(:topic) { create(:topic) }
  let(:target) { create(:target, user: user, topic: topic) }

  subject { delete api_v1_target_path(target), headers: auth_headers, as: :json }

  it 'returns success' do
    subject
    expect(response).to have_http_status(:no_content)
  end

  context 'when record is not found' do
    it 'returns status 404 not found' do
      allow_any_instance_of(Api::V1::TargetsController).to receive(
        :current_user
      ).and_raise(ActiveRecord::RecordNotFound)
      subject
      expect(response).to have_http_status(:not_found)
    end
  end
end
