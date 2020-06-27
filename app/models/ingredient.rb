class Ingredient < ApplicationRecord
  belongs_to :user
  has_many :doses
  has_many :recipes, through: :doses
  validates :name, presence: true, uniqueness: true
end
