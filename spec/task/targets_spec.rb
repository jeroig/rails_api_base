require 'rails_helper'

Rails.application.load_tasks

describe 'Task for delete old targets' do
  let(:user)  { create(:user) }
  let(:topic) { create(:topic) }
  after(:each) do
    Rake::Task['targets:delete:after_a_week'].reenable
  end

  context 'Remove targets from more than one week' do
    before { create(:target, user: user, topic: topic, created_at: Time.zone.now - 7.days) }
    it 'Must delete all old targets' do
      expect {
        Rake::Task['targets:delete:after_a_week'].invoke
      }.to change(Target, :count).from(1).to(0)
    end
  end

  context 'Don not remove newest targets' do
    before { create(:target, user: user, topic: topic, created_at: Time.zone.now) }
    it 'Should not delete newest targets' do
      expect {
        Rake::Task['targets:delete:after_a_week'].invoke
      }.not_to change { Target.count }
    end
  end
end
