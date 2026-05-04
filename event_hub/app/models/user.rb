class User < ApplicationRecord
  has_secure_password

  enum :role, { regular: 0, admin: 1 }

  has_many :organized_events, class_name: "Event", foreign_key: "organizer_id", dependent: :destroy
  has_many :registrations, dependent: :destroy
  has_many :registered_events, through: :registrations, source: :event
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true,
                    uniqueness: { case_sensitive: false },
                    format: { with: URI::MailTo::EMAIL_REGEXP }
end