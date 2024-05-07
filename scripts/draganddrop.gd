extends Node2D

var draggable = false
var is_inside_dropable = false

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
		# When left button on mouse is released, check if it is inside a drop_zone and leave it there.
		# If not in a drop zone but it back where it was before
		elif Input.is_action_just_released("left_mouse_click"):
			global.is_dragging = false
			if is_inside_dropable:
				global_position = get_global_mouse_position() - offset
			else:
				global_position = prev_location
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


func _on_area_2d_body_entered(body:StaticBody2D):
	# Update that object is in a drop zone
	if body.is_in_group("drop_zone"):
		is_inside_dropable = true


func _on_area_2d_body_exited(body:StaticBody2D):
	# Update that object is no longer in a drop zone
	if body.is_in_group("drop_zone"):
		is_inside_dropable = false
