extends Button

func _on_pressed():
	get_node("../shop_window/AnimationPlayer").play("slide in")


