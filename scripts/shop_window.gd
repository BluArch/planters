extends Sprite2D

var mouse_entered = false

func _on_area_2d_mouse_entered():
	mouse_entered = true

func _on_area_2d_mouse_exited():
	if mouse_entered == true:
		get_node("AnimationPlayer").play("slide_out")
		mouse_entered == false
