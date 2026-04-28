extends Node

func save_for_python():
	var data = {
		"day": Global.day,
		"date": Time.get_date_string_from_system(), # Required by your SQL schema
		"revenue": Global.revenue,
		"tips": Global.tips if "tips" in Global else 0.0, # Use 0.0 if not defined
		"orders_served": Global.orders_served,
		"avg_satisfaction": Global.avg_satisfaction,
		"popular_item": "Espresso" # Placeholder or Global.most_popular
	}
	
	var file = FileAccess.open("user://daily_log.json", FileAccess.WRITE)
	file.store_string(JSON.stringify(data))
	file.close()
	
