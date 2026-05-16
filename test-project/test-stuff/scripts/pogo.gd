extends Area2D

@onready var timer = $PogoTimer
@onready var animated_fire = $AnimatedSprite2D

func _ready() -> void:
	set_process(false)
	animated_fire.play("fire_full")




func _on_body_entered(body: Node2D) -> void:
	if body is character:
		set_process(true)
		timer.start(0.1)

func _on_pogo_timer_timeout() -> void:
	if not is_inside_tree():
		return
	get_tree().call_deferred("reload_current_scene")# Replace with function body.
