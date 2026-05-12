extends Area2D



func _on_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file.call_deferred("res://scenes/Level 1/Character Rooms/perry's_room_level_1.tscn")
