class Ingredient < ApplicationRecord
  has_many :portions
  has_many :recipes, through: :portions, source: :portionable, source_type: 'Recipe'
  has_many :cabinets, through: :portions, source: :portionable, source_type: 'Cabinet'
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :sub_type, presence: true
end
