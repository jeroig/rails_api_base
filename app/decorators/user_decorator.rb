class UserDecorator < Draper::Decorator
  delegate_all

  def gender
    I18n.t(super, scope: 'activerecord.attributes.user.genders')
  end
end
