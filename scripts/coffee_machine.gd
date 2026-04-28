extends Area2D

var drinks_prep

func _ready():
	drinks_prep = get_tree().current_scene.find_child("DrinkPrepScreen")

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		drinks_prep.visible = not drinks_prep.visible 
