extends Area2D

@onready var timer: Timer = $Timer

func _on_body_entered(_body: CharacterBody2D) -> void:
	timer.start(1.5)
	Engine.time_scale = 0.5
	_body.get_node("charCol").queue_free()


func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
