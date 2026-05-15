extends Node2D

func _ready() -> void:
	$Collectibles/CollectibleKey._coin_count = 0
	await fade_in()

func fade_in() -> void:
	var t = get_tree().create_tween()
	t.tween_property(self,"modulate:a",1.0,3).from(0.0)
	await t.finished

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("debug_reset"):
		get_tree().call_deferred("reload_current_scene")
