extends Area2D

const SPEED = 100.0
var directions = 1.0

func _ready() -> void:
	pass 



func _process(delta: float) -> void:
	position.x += directions * SPEED * delta


func _on_timer_timeout() -> void:
	directions *= -1


func _on_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
