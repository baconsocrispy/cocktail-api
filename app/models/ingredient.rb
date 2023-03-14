class Ingredient < ApplicationRecord
  has_many :portions
  has_many :recipes, through: :portions
  has_many :cabinets, through: :portions
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :sub_type, presence: true
end
