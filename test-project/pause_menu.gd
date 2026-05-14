extends CanvasLayer



func _ready() -> void:
	visible = false
	get_tree().paused = false
	
	process_mode = Node.PROCESS_MODE_INHERIT
	process_mode = Node.PROCESS_MODE_PAUSABLE
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	process_mode = Node.PROCESS_MODE_ALWAYS
	process_mode = Node.PROCESS_MODE_ALWAYS
	


func _input(_event: InputEvent) -> void:
	print("pause")
	if Input.is_action_just_pressed("Pause"):
		if get_tree().paused:
			visible = false 
			get_tree().paused = false
		else:
			visible = true
			get_tree().paused = true

func _on_resume_pressed() -> void:
	visible = false 
	get_tree().paused = false


func _on_back_to_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://test-stuff/scenes/MainMenu.tscn")
