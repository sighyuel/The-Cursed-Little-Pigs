extends character

func _physics_process(delta: float) -> void:
	velocity += wind_velocity * 0.4 
	move_and_slide()
	rect.visible = false
	if not is_on_floor() && wind_velocity.y == 0.0:
		velocity.y += gravity * delta
	elif wind_velocity.y >0.0:
		delta = 0
	if is_on_floor():
		gravity = 980
	if active == 3:
		rect.visible = true
		_movement()
		_may_glide()
		

#func _on_interact():
	#print("attach")
