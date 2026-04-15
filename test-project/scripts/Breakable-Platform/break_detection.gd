extends StaticBody2D

var time = 1

func _ready():
	set_process(false)
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == 'Dale' and Input.is_action_pressed("Y"):
		set_process(true)
		$Timer.start(0.1)

func _on_timer_timeout() -> void:
	queue_free() # Replace with function body.
