class Recipe < ApplicationRecord
  belongs_to :user
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_many :reviews, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  has_one_attached :photo
end
