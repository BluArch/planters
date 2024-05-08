extends Node

var plant = preload("res://scenes/plant_jar.tscn")

func _on_pressed():
	var instance = plant.instantiate()
	instance.position.x = 150
	instance.position.y = 400
	add_child(instance)
