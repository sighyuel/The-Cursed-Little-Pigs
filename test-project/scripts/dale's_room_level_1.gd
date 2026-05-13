extends Node2D

@onready var Phase2G =  $"Tile Map Layers Phase 2/Ground Phase 2"



func _ready() -> void:
	GlobalSignals.connect("coin_collect",_coin_collect)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("debug_reset"):
		get_tree().call_deferred("reload_current_scene")

func _coin_collect() -> void:
	Phase2G.enabled = true
