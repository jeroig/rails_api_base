task code_analysis: :environment do
  sh 'bundle exec brakeman . -z -q'
  sh 'bundle exec rubocop .'
  sh 'bundle exec reek app lib public spec tmp'
  sh 'RUBYOPT=\'-W0\' bundle exec rails_best_practices .'
end
