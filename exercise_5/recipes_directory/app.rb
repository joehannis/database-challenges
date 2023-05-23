require_relative 'lib/recipe'
require_relative 'lib/recipes_repository'
require_relative 'lib/database_connection'

DatabaseConnection.connect('recipes_directory')

p "All Recipes"

recipes_repository = RecipesRepository.new

recipes_repository.all.each do |recipe|
  p recipe
end

p "Find Recipe"

recipes_repository = RecipesRepository.new

recipes_repository.find(2).each do |recipe|
  p recipe
end
