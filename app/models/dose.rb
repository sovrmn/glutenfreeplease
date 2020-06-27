class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :recipe
  belongs_to :user
  validates :recipe, uniqueness: { scope: :ingredient }
end
