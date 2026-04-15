extends character

func _physics_process(delta: float) -> void:
	move_and_slide()
	rect.visible = false
	if not is_on_floor():
		velocity.y += gravity * delta
#when perry extends, if this goes below to -1, it messes up the move_dir
	if acceleration <= .5:
		acceleration = .5
	if active == 2:
		rect.visible = true
		_movement()
		_perry_stretch()
		_perry_reset()
