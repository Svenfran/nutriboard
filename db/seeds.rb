# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Destroy all...'
Meal.destroy_all
Nutrient.destroy_all
Food.destroy_all
User.destroy_all
puts 'Finished!'

puts 'create user...'
#create user
user = User.create(
  email: "john@example.com",
  password: "password"
)
puts 'Finished!'

puts 'create a meal...'
# create a meal
meal_one = Meal.create(
  category: 'breakfast',
  name: 'Oatmeal',
  user_id: user.id
)
puts 'Finished'

puts 'create foods...'
# create corresponding food
# food in meal one
food_one = Food.create(
  name: 'oats',
  amount: 50,
  unit: 'g',
  meal_id: meal_one.id
)

food_two = Food.create(
  name: 'nuts',
  amount: 50,
  unit: 'g',
  meal_id: meal_one.id
)

food_three = Food.create(
  name: 'blueberries',
  amount: 125,
  unit: 'g',
  meal_id: meal_one.id
)

food_four = Food.create(
  name: 'greek yoghurt',
  amount: 200,
  unit: 'g',
  meal_id: meal_one.id
)
puts 'Finished!'

puts 'create nutrients...'
# create corresponding nutrients
# calories for food in meal_one
calories_one = Nutrient.create(
  name: 'calories',
  amount: 150,
  unit: 'kcal',
  food_id: food_one.id
)

calories_two = Nutrient.create(
  name: 'calories',
  amount: 300,
  unit: 'kcal',
  food_id: food_two.id
)

calories_three = Nutrient.create(
  name: 'calories',
  amount: 50,
  unit: 'kcal',
  food_id: food_three.id
)

calories_four = Nutrient.create(
  name: 'calories',
  amount: 100,
  unit: 'kcal',
  food_id: food_four.id
)

# fat for food in meal_one
fat_one = Nutrient.create(
  name: 'fat',
  amount: 5,
  unit: 'g',
  food_id: food_one.id
)

fat_two = Nutrient.create(
  name: 'calories',
  amount: 50,
  unit: 'g',
  food_id: food_two.id
)

fat_three = Nutrient.create(
  name: 'calories',
  amount: 0,
  unit: 'g',
  food_id: food_three.id
)

fat_four = Nutrient.create(
  name: 'calories',
  amount: 0.2,
  unit: 'g',
  food_id: food_four.id
)

# carbs for food in meal_one
carb_one = Nutrient.create(
  name: 'carbs',
  amount: 60,
  unit: 'g',
  food_id: food_one.id
)

carb_two = Nutrient.create(
  name: 'carbs',
  amount: 5,
  unit: 'g',
  food_id: food_two.id
)

carb_three = Nutrient.create(
  name: 'carbs',
  amount: 15,
  unit: 'g',
  food_id: food_three.id
)

carb_four = Nutrient.create(
  name: 'carbs',
  amount: 0.2,
  unit: 'g',
  food_id: food_four.id
)

# protein for food in meal_one
protein_one = Nutrient.create(
  name: 'protein',
  amount: 5,
  unit: 'g',
  food_id: food_one.id
)

protein_two = Nutrient.create(
  name: 'protein',
  amount: 15,
  unit: 'g',
  food_id: food_two.id
)

carb_three = Nutrient.create(
  name: 'protein',
  amount: 0,
  unit: 'g',
  food_id: food_three.id
)

carb_four = Nutrient.create(
  name: 'protein',
  amount: 20,
  unit: 'g',
  food_id: food_four.id
)
puts 'Finished!'