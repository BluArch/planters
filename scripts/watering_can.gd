extends Node2D

var draggable = false

var prev_location: Vector2
var offset: Vector2

func _process(_delta):
	# If mouse is hovering over object
	if draggable:
		# When left button on mouse is clicked while hovering, grab object
		if Input.is_action_just_pressed("left_mouse_click"):
			offset = get_global_mouse_position() - global_position
			global.is_dragging = true
		if Input.is_action_pressed("left_mouse_click"):
			global_position = get_global_mouse_position() - offset
			# Turning water on and off
			if Input.is_action_just_pressed("right_mouse_click"):
				$can/water.visible = true
				$can.set_rotation_degrees(30)
			elif Input.is_action_just_released("right_mouse_click"):
				$can/water.visible = false
				$can.set_rotation_degrees(0)
				
		elif Input.is_action_just_released("left_mouse_click"):
			global.is_dragging = false
			global_position = get_global_mouse_position() - offset
			
	# Update previous location if not done already
	elif (global_position!= prev_location):
		prev_location = global_position
	
	
func _on_area_2d_mouse_entered():
	# Update draggable that mouse is hovering over object, and little animation to show it is hovered
	if not global.is_dragging:
		draggable = true
		scale = Vector2(1.05, 1.05)
	

func _on_area_2d_mouse_exited():
	# Update drabbale that mouse is no longer hovering, set back to normal size
	if not global.is_dragging:
		draggable = false
		scale = Vector2(1.0, 1.0)
