extends character

func _physics_process(delta: float) -> void:
	velocity += wind_velocity * 0.4 
	move_and_slide()
	rect.visible = false
	if not is_on_floor() && wind_velocity.y == 0.0:
		velocity.y += gravity * delta
	elif wind_velocity.y >0.0:
		delta = 0
#when perry extends, if this goes below to -1, it messes up the move_dir
	if acceleration <= .5:
		acceleration = .5
	if active == 2:
		rect.visible = true
		_movement()
		_perry_stretch()
		_perry_reset()
