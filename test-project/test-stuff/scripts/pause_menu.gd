extends CanvasLayer




func _ready() -> void:
	#GlobalSignals.connect("quit_level",_quit_level)
	visible = false
	get_tree().paused = false
	
	process_mode = Node.PROCESS_MODE_INHERIT
	process_mode = Node.PROCESS_MODE_PAUSABLE
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	process_mode = Node.PROCESS_MODE_ALWAYS
	process_mode = Node.PROCESS_MODE_ALWAYS
	


func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("Pause"):
		if get_tree().paused:
			visible = false 
			get_tree().paused = false
		else:
			visible = true
			get_tree().paused = true
			$Resume.grab_focus()

func _on_resume_pressed() -> void:
	
	visible = false 
	get_tree().paused = false


func _on_quit_game_pressed() -> void:
	$"Back to Menu".set_focus_mode(1)
	get_tree().quit()
	GlobalSignals.quit_level.emit()
	
