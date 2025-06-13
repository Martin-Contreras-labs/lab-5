class Chat < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  has_many :messages, dependent: :destroy

  validates :sender_id, :receiver_id, presence: true
  validate :sender_and_receiver_different

  scope :involving, ->(user) {
    where("sender_id = ? OR receiver_id = ?", user.id, user.id)
  }
  def other_participant(current_user)
    sender == current_user ? receiver : sender
  end

  private

  def sender_and_receiver_different
    if sender_id == receiver_id
      errors.add(:receiver_id, "must be different from sender")
    end
  end
end
  