extends character

@onready var dale_camera = $Camera2D
@onready var dust_particle = $DustParticles
@onready var jump_particles = $JumpParticles
@onready var dale_anim = $AnimatedSprite2D
var original_pos

func walking_feedback() -> void:
	#region walking_feedback
	if move_dir == 0:
		dale_anim.play("dale_idle")
		dust_particle.emitting = false
	
	if move_dir == 1:
		dust_particle.emitting = true
		dust_particle.position.x = -20
	
	if move_dir == -1:
		dust_particle.emitting = true
		dust_particle.position.x = 20
	#endregion

func sprite_anim_abilities() -> void:
	if dale_ground_pounding and not is_on_floor():
		dale_anim.scale.x = 1


func _ready():
	original_pos = get_position()

func _physics_process(delta: float) -> void:
	move_and_slide()
	
	rect.visible = false
	dale_camera.enabled = false
	walking_feedback()
	
	
	
	if is_jumping and move_dir == 0:
		jump_sound.play()
		dale_anim.play("dale_jump")
	else:
		is_jumping = false
	
	if health == 0.0:
		global_position = original_pos
		health = 10
	
	if is_on_floor():
		jump_particles.emitting = false
	
	if not is_on_floor():
		velocity.y += _getgravity(velocity) * delta
		dust_particle.emitting = false
		jump_particles.emitting = true
	
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
		
		if Input.is_action_pressed("ui_right"):
			velocity.x = speed
			dale_anim.scale.x = 1
		elif Input.is_action_pressed("ui_left"):
			velocity.x = speed
			dale_anim.scale.x = -1
		else:
			velocity.x = 0
	
		if velocity.x:
			if is_on_floor():
				dale_anim.play("dale_walk")
		else:
			dale_anim.play("dale_jump")
		
		_dale_slam()
		rect.visible = true
		_camera_transition()
