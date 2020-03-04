class Event < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :location, presence: true
  validates :date, presence: true

  def summarize
    "#{title} - #{location} - #{date}"
  end
end
