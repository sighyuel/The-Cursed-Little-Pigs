extends StaticBody2D

var time = 1
@onready var timer : Timer
@onready var ground_smash = $Sounds/GroundSmash
@onready var dale_slam_down = $Sounds/DaleSlamDown
@onready var smoke_particle = $Smoke
@onready var stone_particle = $Stone


func _ready():
	set_process(false)
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == 'Dale' and Input.is_action_pressed("Y"):
		ground_smash.play()
		dale_slam_down.playing = false
		smoke_particle.emitting = true
		stone_particle.emitting = true
		set_process(true)
		$Timer.start(0.3)

func _on_timer_timeout() -> void:
	queue_free()
	smoke_particle.emitting = false
	
	
