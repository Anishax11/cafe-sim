extends CharacterBody2D
class_name Customer
@onready var patience_timer: Timer = $PatienceTimer

# Shared variables
var order_preference: String = "Espresso"
var patience_level: float = 30.0
var current_patience: float

func _ready():
	current_patience = patience_level
	patience_timer.wait_time = patience_level
	patience_timer.start()

func _on_patience_timer_timeout() -> void:
	leave()

func leave():
	Global.current_orders.erase(order_preference)
	Global.customer_orders.erase(self.name)
	print("Removing order")
	print(Global.current_orders)
	for key in Global.customer_orders:
		if key == self.name:
			Global.customer_orders.erase(key)
	queue_free()


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		Dialogic.VAR.order = order_preference
		Dialogic.start("timeline")
		print(self.name," : ",Global.customer_orders[self.name])
