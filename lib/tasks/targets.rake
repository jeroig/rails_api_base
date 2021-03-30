namespace :targets do
  namespace :delete do
    desc 'Delete targets after one week'
    task after_a_week: :environment do
      Target.where('created_at <= ?', 1.week.ago).destroy_all
    end
  end
end
