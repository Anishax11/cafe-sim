extends Control
@onready var nine_patch_rect: NinePatchRect = $NinePatchRect

var coffee : int
var milk : int
var cream : int
var sugar : int

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
	nine_patch_rect.visible = false
	if prepared_order in Global.current_orders:
		print("Order found")
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
		Global.avg_satisfaction = (Global.avg_satisfaction+satisfaction)/Global.orders_served
		Global.update_revenue(Global.menu["drinks"][prepared_order]["price"])
