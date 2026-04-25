extends Area2D

const SPEED = 100.0
var directions = 1.0


func _process(delta: float) -> void:
	position.x += directions * SPEED * delta


func _on_timer_timeout() -> void:
	directions *= -1


func _on_body_entered(body: Node2D) -> void:
	if body is character:
		print("inside enemy")
		get_tree().call_deferred("reload_current_scene") # Replace with function body.
