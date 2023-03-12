def seed_sort_options 
  sort_options = ['All Recipes', 'Favorites', 'I Have Any Ingredient', 'I Have All Ingredients']
  sort_options.each do |option|
    sort_option = SortOption.find_by(name: option)
    SortOption.create!(name: option) if !sort_option
  end
  p 'Sort Options Successfully Updated'
end
