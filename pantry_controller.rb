require 'pantry'
require 'recipe'

r = Recipe.new
p = Pantry.new

r.cook(p)

class Recipe
  attr_reader :ingredients

  def initialize
    @ingredients = Hash.new(0)
  end

  def cook(pantry_object)
    @ingredients.each do |ingredient|
      pantry_object.ingredients[ingredient] -= ingredients[ingredient]
    end
  end

end

class Pantry
  attr_reader :ingredients

  def initialize
    @ingredients = Hash.new(0)
    @emergency_supplies = {"machete"=>1, "bandaids"=>1000}
  end

  def cook(class_im_taking_in)
    class_im_taking_in.ingredients
  end

  def restock(quantity)
    @ingredients.keys.each do |item|
      @ingredients[item] += quantity
    end
  end

  def get_ready_for_zombies
    @emergency_supplies.keys.each do |item|
      @ingredients[item] += @emergency_supplies[item]
    end
  end

end
