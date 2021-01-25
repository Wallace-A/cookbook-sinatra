require "csv"

class Cookbook
  attr_reader :recipes

  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @recipes = load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    # create new recipe from class
    @recipes << recipe
    save_cookbook_to_csv
  end

  def remove_recipe(index)
    @recipes.delete_at(index - 1)
    save_cookbook_to_csv
  end

  def mark_recipe(index)
    recipes[index].mark
    save_cookbook_to_csv
  end
  private

  def load_csv
    cookbook_recipes = []
    CSV.foreach(@csv_file_path) do |row|
      recipe_to_load = Recipe.new(row[0], row[1])
      cookbook_recipes << recipe_to_load
    end
    cookbook_recipes
  end

  def save_cookbook_to_csv
    csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
    CSV.open(@csv_file_path, 'wb', csv_options) do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
