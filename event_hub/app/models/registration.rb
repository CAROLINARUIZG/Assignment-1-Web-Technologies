class Registration < ApplicationRecord
  enum :status, { confirmed: 0, waiting_list: 1, cancelled: 2 }

  belongs_to :user
  belongs_to :event

  validates :user_id, uniqueness: { scope: :event_id, message: "is already registered for this event" }

  before_validation :set_registered_at, on: :create

  private

  def set_registered_at
    self.registered_at ||= Time.current
  end
end