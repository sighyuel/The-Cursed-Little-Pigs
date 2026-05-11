extends Area2D

@onready var timer = $PogoTimer

func _ready() -> void:
	set_process(false)

func _on_body_entered(body: Node2D) -> void:
	if body is character:
		set_process(true)
		timer.start(1.5)

func _on_pogo_timer_timeout() -> void:
	if not is_inside_tree():
		return
	get_tree().call_deferred("reload_current_scene")# Replace with function body.
