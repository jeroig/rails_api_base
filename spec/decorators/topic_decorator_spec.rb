describe TopicDecorator do
  let(:topic) { create(:topic) }
  let(:decorated_topic) { topic.decorate }

  it 'returns same name' do
    expect(decorated_topic.name).to eq(topic.name)
  end
end
