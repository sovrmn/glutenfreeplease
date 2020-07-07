# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Recipe.destroy_all
p "Recipes destroyed"
Ingredient.destroy_all
p "Ingredients destroyed"
Dose.destroy_all
p "Doses destroyed"
User.destroy_all
p "users destroyed"
puts "...database under creation"

user_1 = User.create(email: "georgecoffeelover@gmail.com", username:"Georgie",  password:"Nespresso007")

riz = Ingredient.create(name: "farine de riz")
chataigne = Ingredient.create(name: "farine de châtaigne")
levure = Ingredient.create(name: "levure en poudre")
margarine = Ingredient.create(name: "margarine non hydrogénée")
chocolat = Ingredient.create(name: "chocolat")
oeufs = Ingredient.create(name: "oeufs")
vanille = Ingredient.create(name: "vanille")
bananes = Ingredient.create(name: "bananes")
noix = Ingredient.create(name: "noix")
pécan = Ingredient.create(name: "noix de pécan")
sucre = Ingredient.create(name: "sucre non raffiné")
olive = Ingredient.create(name: "huile d'olive")
sucre_glace = Ingredient.create(name: "sucre glace")
puree_amande = Ingredient.create(name: "purée d'amandes")
quinoa = Ingredient.create(name: "farine de quinoa")
lait_végétal = Ingredient.create(name: "lait végétal")


cookies = Recipe.create(name: "cookies moelleux")


Dose.create(description:"2", ingredient_id: bananes.id, recipe_id: cookies.id, user_id: user_1)
Dose.create(description:"60g", ingredient_id: chataigne.id, recipe_id: cookies.id, user_id: user_1)
Dose.create(description:"120", ingredient_id: puree_amande.id, recipe_id: cookies.id, user_id: user_1)
Dose.create(description:"100", ingredient_id: sucre.id, recipe_id: cookies.id, user_id: user_1)
Dose.create(description:"100g", ingredient_id: chocolat.id, recipe_id: cookies.id, user_id: user_1)
Dose.create(description:"60g", ingredient_id: noix.id, recipe_id: cookies.id, user_id: user_1)
Dose.create(description:"1 caf", ingredient_id: levure.id, recipe_id: cookies.id, user_id: user_1)
