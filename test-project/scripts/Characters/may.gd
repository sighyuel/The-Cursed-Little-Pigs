extends character

func _physics_process(delta: float) -> void:
	move_and_slide()
	rect.visible = false
	if not is_on_floor():
		velocity.y += gravity * delta
	if is_on_floor():
		gravity = 980
	if active == 3:
		rect.visible = true
		_movement()
		_may_glide()
