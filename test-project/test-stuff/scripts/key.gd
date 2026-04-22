extends Area2D

func _on_body_entered(_body: CharacterBody2D) -> void:
	queue_free()
