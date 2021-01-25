class Recipe
  attr_reader :name, :description, :rating, :cooked, :prep_time

  def initialize(name, description, rating = nil, prep_time = "N/A")
    @name = name
    @description = description
    @rating = rating
    @cooked = false
    @prep_time = prep_time
  end

  def mark
    @cooked = true
  end
end
