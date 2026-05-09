extends CanvasLayer



func _ready() -> void:
	visible = false
	get_tree().paused = false
	
	process_mode = Node.PROCESS_MODE_INHERIT
	process_mode = Node.PROCESS_MODE_PAUSABLE
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED
	process_mode = Node.PROCESS_MODE_ALWAYS
	process_mode = Node.PROCESS_MODE_ALWAYS

func _input(event:InputEvent) -> void:
	if Input.is_action_just_pressed("Pause"):
		if get_tree().paused:
			visible = true
			get_tree().paused = true
		else:
			visible = false
			get_tree().paused = false

func _on_resume_pressed() -> void:
	visible = true
	get_tree().paused = true
