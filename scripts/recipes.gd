extends NinePatchRect
@onready var v_box_container: VBoxContainer = $ScrollContainer/VBoxContainer
@onready var nine_patch_rect: NinePatchRect = $"../NinePatchRect"


func _ready() -> void:
	for label in v_box_container.get_children():
		label.get_node("Button").pressed.connect(_on_button_pressed.bind(label.get_node("Button")))
		label.get_node("Button").text = "Start"
		label.get_node("Button").text = "+"
	
	
		
func _on_button_pressed(button : Button) -> void:
	var label = button.get_parent()
	print("Label button down : ",label.name)
	if label.custom_minimum_size == Vector2(50, 70):
		label.custom_minimum_size = Vector2(50, 10)
		button.position=Vector2(60,0) # Button appears at bottom right of label
		button.text = "+"
		nine_patch_rect.visible = true
		get_parent().prepared_order = button.get_parent().name
		return
	label.custom_minimum_size = Vector2(50, 70)
	button.position=Vector2(30,60) # Button appears at bottom right of label
	button.text = "Start"
	
	
