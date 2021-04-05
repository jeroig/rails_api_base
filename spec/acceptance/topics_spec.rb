require_relative '../support/acceptance_tests_helper'

resource 'Topics' do
  header 'Content-Type', 'application/json'
  header 'access-token', :access_token_header
  header 'client', :client_header
  header 'uid', :uid_header

  let(:user) { create(:user) }

  route 'api/v1/topics', 'List Topics' do
    get 'Index' do
      example 'Ok' do
        create(:topic)
        do_request

        expect(status).to eq 200
      end
    end
  end
end
