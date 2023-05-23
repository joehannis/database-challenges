require 'recipes_repository'

RSpec.describe RecipesRepository do
  def reset_recipes_table
    seed_sql = File.read('spec/recipes_seed.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'recipes_directory_test' })
    connection.exec(seed_sql)
  end

  before(:each) do
    reset_recipes_table
  end
  it 'Returns a list of recipes' do
    repo = RecipesRepository.new
    recipes = repo.all
    expect(recipes.length).to eq(2)
    expect(recipes.first.id).to eq('1')
    expect(recipes.first.name).to eq "Spaghetti Bolognese"
  end
  it 'Returns single album based on id' do
    recipe = RecipesRepository.new
    result = recipe.find('1')
    expect(result.first.name).to eq 'Spaghetti Bolognese'
  end

end