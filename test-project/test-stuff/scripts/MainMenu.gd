extends Node2D

@onready var button_manager: Control = $Button_manager
@onready var options_box: Panel = $OptionsBox

func _ready():
	button_manager.visible = true
	options_box.visible = false

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://test-stuff/levels/test-level.tscn")


func _on_options_pressed() -> void:
	print("Settings pressed")
	button_manager.visible = false
	options_box.visible = true

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_back_pressed() -> void:
	_ready()


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://test-stuff/scenes/credit_screen.tscn")
