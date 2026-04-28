extends CanvasLayer


func _on_button_button_down() -> void:
	SaveLoad.save_for_python()
	Global.revenue+=Global.daily_revenue
	Global.daily_revenue = 0
	Global.orders_served = 0
	Global.avg_satisfaction = 0
	Global.day+=1
	Global.update_revenue(0)
