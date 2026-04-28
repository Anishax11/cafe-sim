extends Node2D

const CUSTOMER = preload("res://scenes/customer.tscn") # reference to base customer class
@onready var timer: Timer = $Timer

func spawn_customer():
	var new_customer = CUSTOMER.instantiate()# 1. Create the actual instance (The "Blueprint to Object" step)
	var spawn_pos = Vector2(randi_range(-200,350),randi_range(-150,100))# 2. Pick a random spawn location
	new_customer.position = spawn_pos
	new_customer.get_node("AnimatedSprite2D").play("customer"+str(randi_range(1,3)))
	new_customer.order_preference = Menu.items[(randi_range(0,Menu.items.size()-1))]
	add_child(new_customer)# 3. Add them to the scene so they become visible/active
 
	
	

func _on_timer_timeout() -> void:
	spawn_customer()
