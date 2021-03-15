# == Schema Information
#
# Table name: topics
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_topics_on_name  (name) UNIQUE
#
require 'rails_helper'

RSpec.describe TopicsController, type: :routing do
  describe 'routing' do
    xit 'routes to #index' do
      expect(get: '/topics').to route_to('topics#index')
    end

    xit 'routes to #show' do
      expect(get: '/topics/1').to route_to('topics#show', id: '1')
    end

    xit 'routes to #create' do
      expect(post: '/topics').to route_to('topics#create')
    end

    xit 'routes to #update via PUT' do
      expect(put: '/topics/1').to route_to('topics#update', id: '1')
    end

    xit 'routes to #update via PATCH' do
      expect(patch: '/topics/1').to route_to('topics#update', id: '1')
    end

    xit 'routes to #destroy' do
      expect(delete: '/topics/1').to route_to('topics#destroy', id: '1')
    end
  end
end
