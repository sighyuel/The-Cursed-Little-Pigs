extends Node2D



func _ready() -> void:
	process_mode = Node.PROCESS_MODE_INHERIT
	process_mode = Node.PROCESS_MODE_PAUSABLE
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	process_mode = Node.PROCESS_MODE_ALWAYS
	process_mode = Node.PROCESS_MODE_ALWAYS


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://test-stuff/scenes/MainMenu.tscn")
