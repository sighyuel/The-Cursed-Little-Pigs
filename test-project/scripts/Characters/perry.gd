extends character

@onready var perry_camera = $Camera2D
@onready var dust_particle = $DustParticles
@onready var jump_particle = $JumpParticles
var original_pos

func _ready():
	original_pos = get_global_position()
	

func walking_feedback() -> void:
	#region walking_feedback
	if move_dir == 0:
		dust_particle.emitting = false
	
	if move_dir == 1:
		dust_particle.emitting = true
	
	if move_dir == -1:
		dust_particle.emitting = true
	
	if not is_on_floor():
		jump_particle.emitting = true
	
	if is_on_floor():
		jump_particle.emitting = false
	
	if tree_mode_activated:
		jump_particle.emitting = false
		dust_particle.emitting = false
	#endregion

func _physics_process(delta: float) -> void:
	print(move_dir)
	velocity += wind_velocity * 0.4 
	velocity += platform_speed * 0.4
	move_and_slide()
	rect.visible = false
	perry_camera.enabled = false
	walking_feedback()
	
	if health == 0.0:
		global_position = original_pos
		health = 10
	
	if not is_on_floor() && wind_velocity.y == 0.0:
		velocity.y += _getgravity(velocity) * delta
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
