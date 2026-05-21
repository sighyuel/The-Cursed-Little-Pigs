extends Node2D

@onready var Phase1P = $Hazards/Pogo
@onready var Phase2G =  $"Tile Map Layers Phase 2/Ground Phase 2"
@onready var Phase2TP = $"Level Objects/Teleporter"
@onready var tp_anim = $"Level Objects/Teleporter/AnimatedSprite2D"


func _ready() -> void:
	GlobalSignals.connect("coin_collect",_coin_collect)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("debug_reset"):
		get_tree().call_deferred("reload_current_scene")

func _coin_collect() -> void:
	Phase1P.visible = false
	Phase1P.set_collision_mask_value(2, false)
	Phase2G.enabled = true
	Phase2TP.set_collision_mask_value(2, true)
	tp_anim.play("default")
