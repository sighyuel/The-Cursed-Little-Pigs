extends Node2D

func _ready() -> void:
	$%CollectibleKey._coin_count = 0


func _on_button_pressed() -> void:
	get_tree().quit()
