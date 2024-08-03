extends Node

#@onready var shop = $shop.Sprite2D

var plant = preload("res://scenes/plant_jar.tscn")

func _on_ready():
	$Button.font_size = 40
	
func _on_pressed():
	#shop.AnimationPlayer.play("slide_in")
	return
