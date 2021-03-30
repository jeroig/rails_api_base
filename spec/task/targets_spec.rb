require 'rails_helper'

Rails.application.load_tasks

describe 'Task for delete old targets' do
  let(:user)  { create(:user) }
  let(:topic) { create(:topic) }
  context 'Remove targets from more than one week' do
    before { 10.times { create(:target, user: user, topic: topic, created_at: Time.now - 7.days) } }
    it 'Must delete all old targets' do
      expect {
        Rake::Task['targets:delete:after_a_week'].invoke
      }.to change(Target, :count).from(10).to(0)
    end
  end
end
