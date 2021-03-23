describe TargetDecorator do
  let(:target) { create(:target) }
  let(:decorated_target) { target.decorate }

  it 'returns same title' do
    expect(decorated_topic.title).to eq(topic.title)
  end
end
