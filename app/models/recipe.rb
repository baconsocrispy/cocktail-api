class Recipe < ApplicationRecord
  before_validation :generate_slug

  include Portionable
  
  has_and_belongs_to_many :users
  has_and_belongs_to_many :tools
  has_and_belongs_to_many :categories
  has_many :ingredients, through: :portions
  has_many :steps, dependent: :destroy
  has_many :favorite_recipes
  has_many :favorited_by, through: :favorite_recipes, source: :user

  accepts_nested_attributes_for :steps, allow_destroy: true
  accepts_nested_attributes_for :categories_recipes, allow_destroy: false
  accepts_nested_attributes_for :portions, allow_destroy: true, reject_if: proc { |att| att['ingredient_id'].blank? }

  validates :name, presence: true
  validates :slug, presence: true

  # FILTERING LOGIC 

  # ordering scopes
  scope :alphabetical, -> { order(:name) }

  # filtering scopes
  scope :search, -> (search_term) { 
    where('recipes.name ILIKE ?', "%#{ search_term }%")
    .distinct if search_term.present? 
  }

  scope :by_category, -> (category_ids) { 
    joins(:categories)
    .where(categories: { id: category_ids }) if category_ids.present? 
  }

  scope :by_any_ingredient, -> (ingredient_ids) { 
    joins(:ingredients)
    .where(ingredients: { id: ingredient_ids })
    .distinct 
  }

  scope :user_has_all_ingredients, -> (user_ingredients) { 
    joins(:ingredients)
    .group(:id)
    .having(
      'array_agg(ingredients.id) <@ ?', user_ingredients
    ) if user_ingredients.present? 
  }

  scope :by_all_ingredients, -> (ingredient_ids) {
    joins(:ingredients)
    .group(:id)
    .having(
      'array_agg(ingredients.id) @> ?', ingredient_ids
    ) if ingredient_ids.present?
  }
  
  def self.search_all_recipes(params)
    # formats ingredient id array for postgresql
    ingredient_ids = '{' + params[:ingredientIds].join(', ') + '}' if params[:ingredientIds]
    category_ids = params[:categoryIds]

    by_category(category_ids)
      .by_all_ingredients(ingredient_ids)
      .search('bravest')
  end

  # helpers
  def to_param
    slug
  end

  def generate_slug
    self.slug ||= name.parameterize
  end
end
