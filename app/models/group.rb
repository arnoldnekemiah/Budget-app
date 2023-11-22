class Group < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true

  belongs_to :author, class_name: 'User', foreign_key: 'user_id'
  has_many :spendings

  # Use Active Storage to handle the attached file
  has_one_attached :icon
end
