extends Node2D

@onready var Phase2WA = $"Hazards Phase 2/WindArea2d"
@onready var Phase2PE = $"Hazards Phase 2/PatrolEnemy"
@onready var TP = $"Level Objects/Teleporter"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalSignals.connect("coin_collect",_coin_collect)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().call_deferred("reload_current_scene")

func _coin_collect() -> void:
	Phase2WA.visible = true
	Phase2WA.set_collision_mask_value(2, true)
	
	Phase2PE.visible = true
	Phase2PE.set_collision_mask_value(2, true)
	
	TP.set_collision_mask_value(2, true)
