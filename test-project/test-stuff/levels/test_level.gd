extends Node2D

func _ready() -> void:
	$Collectibles/CollectibleKey._coin_count = 0

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().call_deferred("reload_current_scene")
