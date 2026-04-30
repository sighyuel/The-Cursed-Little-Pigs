extends character

@onready var ladder: Area2D = $Ladder
@onready var perry_camera = $Camera2D


func _physics_process(delta: float) -> void:
	print(tree_mode_activated)
	velocity += wind_velocity * 0.4 
	move_and_slide()
	rect.visible = false
	perry_camera.enabled = false
	
	if not is_on_floor() && wind_velocity.y == 0.0:
		velocity.y += gravity * delta
	elif wind_velocity.y >0.0:
		delta = 0
#when perry extends, if this goes below to -1, it messes up the move_dir
	if acceleration <= .5:
		acceleration = .5
	
	if Global_Variables.active == 2:
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
		rect.visible = true
		_camera_transition()
		_perry_stretch()
		_perry_reset()
