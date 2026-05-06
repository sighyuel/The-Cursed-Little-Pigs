extends StaticBody2D

var time = 1
@onready var timer : Timer
@onready var ground_smash = $Sounds/GroundSmash
@onready var dale_slam_down = $Sounds/DaleSlamDown

func _ready():
	set_process(false)
	

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == 'Dale' and Input.is_action_pressed("Y"):
		ground_smash.play()
		dale_slam_down.playing = false
		set_process(true)
		$Timer.start(0.3)

func _on_timer_timeout() -> void:
	queue_free() # Replace with function body.
