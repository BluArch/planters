extends Button

var plant = preload("res://scenes/plant_jar.tscn")

func _on_pressed():
	var instance = plant.instantiate()
	instance.set_plant_type("monstera")
	add_child(instance)
