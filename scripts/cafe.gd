extends Node2D


func _on_button_button_down() -> void:
	print("Saving")
	SaveLoad.save_for_python()
