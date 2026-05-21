extends Area2D


# Called when the node enters the scene tree for the first time.



func _on_body_entered(body: Node2D) -> void:
	get_tree().change_scene_to_file.call_deferred("res://scenes/Level 1/Character Rooms/dale's_room_level_1.tscn")
