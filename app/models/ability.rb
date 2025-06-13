class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    if user.admin?
      can :manage, User
    else
      cannot :read, User
    end
    can :read, Message do |message|
      message.user_id == user.id ||
        message.chat.sender_id == user.id ||
        message.chat.receiver_id == user.id
    end

    can :create, Message
    can [:update, :destroy], Message, user_id: user.id

    can :read, Chat do |chat|
      chat.sender_id == user.id || chat.receiver_id == user.id
    end
    can :create, Chat
  end
end
