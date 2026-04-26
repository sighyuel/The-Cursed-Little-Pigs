extends character

func _physics_process(delta: float) -> void:
	move_and_slide()
	rect.visible = false
	
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Global_Variables.active == 1:
		if _on_ladder:
			ladder_movement(delta)
		else:
			_movement(delta)
		if _is_on_ladder() and (Input.is_action_pressed("ui_up") or Input.is_action_pressed("ui_down")):
			_on_ladder = true
		else:
			_on_ladder = false
		if is_on_floor() and Input.is_action_just_pressed("ui_down"):
			GlobalSignals.oneway_disabled.emit()
		$LadderDetect.text = "is on ladder: " + str(_on_ladder)
		
		_dale_slam()
		rect.visible = true
