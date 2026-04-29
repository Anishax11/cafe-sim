extends Control
@onready var nine_patch_rect: NinePatchRect = $NinePatchRect
@onready var recipes: NinePatchRect = $Recipes

var coffee : int = 0
var milk : int = 0
var cream : int = 0
var sugar : int = 0

var prepared_order


func _on_coffee_button_down() -> void:
	coffee+=1


func _on_milk_button_down() -> void:
	milk+=1


func _on_vanilla_button_down() -> void:
	cream+=1


func _on_sugar_button_down() -> void:
	sugar+=1


func _on_button_button_down() -> void:
	visible = false
	if prepared_order in Global.current_orders:
		#print("Order found")
		Global.daily_revenue+=Global.menu["drinks"][prepared_order]["price"]
		var satisfaction = 0
		if sugar==Global.menu["drinks"][prepared_order]["sugar"]:
			satisfaction+=1
		if milk==Global.menu["drinks"][prepared_order]["milk"]:
			satisfaction+=1
		if coffee==Global.menu["drinks"][prepared_order]["coffee"]:
			satisfaction+=1
		if cream==Global.menu["drinks"][prepared_order]["cream"]:
			satisfaction+=1
		satisfaction*=25
		Global.orders_served+=1
		Global.tot_satisfaction += satisfaction
		Global.avg_satisfaction = Global.tot_satisfaction/Global.orders_served
		print(satisfaction)
		print(Global.avg_satisfaction)
		Global.update_revenue(Global.menu["drinks"][prepared_order]["price"])
		for key in Global.customer_orders:
			if Global.customer_orders[key] == prepared_order and get_tree().current_scene.find_child(key):
				get_tree().current_scene.find_child(key).leave()
