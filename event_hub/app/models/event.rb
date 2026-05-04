class Event < ApplicationRecord
  enum :status, { draft: 0, published: 1, ongoing: 2, completed: 3, cancelled: 4 }

  belongs_to :organizer, class_name: "User"
  belongs_to :category
  belongs_to :location

  has_many :registrations, dependent: :destroy
  has_many :attendees, through: :registrations, source: :user
  has_many :reviews, dependent: :destroy

  validates :title, :description, presence: true
  validates :start_date, :end_date, presence: true
  validates :max_capacity, numericality: { only_integer: true, greater_than: 0 }
  validate  :end_date_after_start_date

  private

  def end_date_after_start_date
    return if start_date.blank? || end_date.blank?
    errors.add(:end_date, "must be after start date") if end_date <= start_date
  end
end