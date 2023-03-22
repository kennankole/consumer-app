class Group < ApplicationRecord
  validates :name, presence: true
  validates :icon, presence: true
  belongs_to :user, class_name: 'User'
  has_and_belongs_to_many :entities
end
