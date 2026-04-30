extends Node2D


#


# Called every frame. 'delta' is the elapsed time since the previous frame.



func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://test-stuff/levels/test-level.tscn")


#func _on_options_pressed() -> void:
	#get_tree().change_scene_to_file()


func _on_quit_pressed() -> void:
	get_tree().quit()
