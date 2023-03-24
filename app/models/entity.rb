class Entity < ApplicationRecord
  validates :name, presence: true
  validates :amout, numericality: { greater_than_or_equal_to: 0 }, presence: true
  belongs_to :user, class_name: 'User'
  has_and_belongs_to_many :groups
end
