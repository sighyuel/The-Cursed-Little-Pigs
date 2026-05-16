extends Node2D

@onready var button_manager: Control = $Button_manager
@onready var options_box: Panel = $OptionsBox

func _ready():
	#GlobalSignals.connect("quit_level",_quit_level)
	$Button_manager/Start.grab_focus()
	button_manager.visible = true
	options_box.visible = false
	await fade_in()

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Level 1/Character Rooms/may's_room_level_1.tscn")

func fade_in() -> void:
	var t = get_tree().create_tween()
	t.tween_property(self,"modulate:a",1.0,5.0).from(0.0).set_ease(Tween.EASE_IN_OUT)

func _on_options_pressed() -> void:
	$OptionsBox/Back.grab_focus()
	print("Settings pressed") 
	button_manager.visible = false
	options_box.visible = true

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_back_pressed() -> void:
	_ready()


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://test-stuff/scenes/credit_screen.tscn")

#func _quit_level() -> void:
	#print("quit")
	#$AudioStreamPlayer.play(0.0)
