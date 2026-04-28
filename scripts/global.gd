extends Node

var day : int = 2
var revenue = 0
var orders_served : int = 0
var avg_satisfaction : int = 0
var daily_revenue = 0
var current_orders =["Espresso"]

var menu = {
	"drinks" ={
		"Espresso" = {
			"price" : 100,
			"sugar" : 0,
			"milk" : 0,
			"coffee" : 2,
			"cream" : 0,
			"description" : "Strong and bold — double shot of coffee, no milk or sugar. Pure caffeine kick."
			
		},
		"Latte" = {
			"price" : 200,
			"sugar" : 1,
			"milk" : 2,
			"coffee" : 1,
			"cream" : 0,
			"description" : "Smooth and balanced — light coffee with 2x milk and a touch of sugar."
		},
		"Frappe" = {
			"price" : 150,
			"sugar" : 2,
			"milk" : 1,
			"coffee" : 1,
			"cream" : 1,
			"description" : "Chilled and sweet — coffee blended with milk, 2x sugar, and a hint of cream."
			
		},
		"Hot Chocolate" = {
			"price" : 250,
			"sugar" : 2,
			"milk" : 2,
			"coffee" : 0,
			"cream" : 1,
			"description" : "Rich and cozy — 0× coffee, 2× milk, 2× sugar, 1× cream."
		}
	}
}

func update_revenue(rev):
	daily_revenue+=rev
	get_tree().current_scene.find_child("RevenueLabel").text = "Revenue : " + str(daily_revenue)
