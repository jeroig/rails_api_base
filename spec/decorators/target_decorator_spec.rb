describe TargetDecorator do
  let(:user) { create(:user) }
  let(:topic) { create(:topic) }
  let(:target) { create(:target, user: user, topic: topic) }
  let(:decorated_target) { target.decorate }

  it 'returns same title' do
    expect(decorated_target.title).to eq(target.title)
  end
end
