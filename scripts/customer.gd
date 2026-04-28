extends CharacterBody2D
class_name Customer

# Shared variables
var order_preference: String = "Coffee"
var patience_level: float = 10.0
var current_patience: float

func _ready():
	current_patience = patience_level
	start_patience_timer()

func start_patience_timer():
	# Logic to decrease patience over time
	pass

func serve(item: String):
	if item == order_preference:
		leave_happy()
	else:
		print("Wrong order!")

func leave_happy():
	queue_free() # Remove from scene
