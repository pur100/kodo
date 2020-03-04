class Post < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true

  def summarize
    "#{title} - #{created_at} - #{user.username}"
  end
end
