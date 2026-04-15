extends character

func _physics_process(delta: float) -> void:
	move_and_slide()
	rect.visible = false
	if not is_on_floor():
		velocity.y += gravity * delta
	if active == 1:
		rect.visible = true
		_movement()
		_dale_slam()
		
