extends StaticBody2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

func _ready() -> void:
	GlobalSignals.connect("oneway_disabled",_on_oneway_disabled)

func _on_oneway_disabled() -> void:
	collision_shape_2d.disabled = true
	await get_tree().create_timer(0.2).timeout
	collision_shape_2d.disabled = false
