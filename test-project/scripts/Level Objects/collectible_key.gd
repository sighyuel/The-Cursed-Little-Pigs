extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body is Node2D:
		queue_free() # Replace with function body.
