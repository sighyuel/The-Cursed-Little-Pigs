extends Node2D

@onready var Phase2BP = $Phase2/single_use_platform
@onready var Phase2TML = $Phase2/TileMapLayer
@onready var Phase2PE = $Phase2/PatrolEnemy
@onready var Phase2TP = $"Level Objects/Teleporter"
@onready var Phase1TML = $TileMapLayer/TileMapLayer2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignals.connect("coin_collect",_coin_collect)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("debug_reset"):
		get_tree().call_deferred("reload_current_scene")

func _coin_collect():
	Phase2BP.visible = true
	Phase2TML.enabled = true
	Phase2PE.visible = true
	Phase2TP.set_collision_mask_value(2, true)
	Phase1TML.enabled = false
