extends character

@onready var may_camera = $Camera2D
@onready var dust_particle = $DustParticles
@onready var jump_particle = $JumpParticles
var original_pos

func _ready() -> void:
	original_pos = get_global_position()

func walking_feedback() -> void:
#region walking feedback
	if move_dir == 0:
		dust_particle.emitting = false
	
	if move_dir == 1:
		dust_particle.emitting = true
	
	if move_dir == -1:
		dust_particle.emitting = true
	
	if not is_on_floor():
		jump_particle.emitting = true
		dust_particle.emitting = false
	if may_is_flying:
		jump_particle.emitting = false
#endregion

func _physics_process(delta: float) -> void:
	velocity += wind_velocity * 0.8
	move_and_slide()
	rect.visible = false
	may_camera.enabled = false
	walking_feedback()
	
	if health == 0:
		global_position = original_pos
		health = 10
	
	if not is_on_floor() && wind_velocity.y == 0.0:
		velocity.y += _getgravity(velocity) * delta
	elif wind_velocity.y > 0.0:
		delta = 0
	if is_on_floor():
		jump_particle.emitting = false
		gravity = 1200
	
	if Global_Variables.active == 3:
		_may_glide(delta)
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
