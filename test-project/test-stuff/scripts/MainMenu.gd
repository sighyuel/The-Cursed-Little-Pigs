extends Node2D

@onready var button_manager: Control = $Button_manager
@onready var options_box: Panel = $OptionsBox
@onready var level_select: Panel = $Panel

func _ready():
	button_manager.visible = true
	options_box.visible = false

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://test-stuff/levels/test-level.tscn")


func _on_options_pressed() -> void:
	button_manager.visible = false
	options_box.visible = true

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_back_pressed() -> void:
	_ready()


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://test-stuff/scenes/credit_screen.tscn")


func _on_level_select_pressed() -> void:
	button_manager.visible = false
	level_select.visible = true


func _on_dale_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level 1/Character Rooms/dale's_room_level_1.tscn")


func _on_may_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level 1/Character Rooms/may's_room_level_1.tscn")
