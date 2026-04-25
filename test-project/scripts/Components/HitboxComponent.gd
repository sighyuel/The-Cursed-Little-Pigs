extends Area2D
class_name HitboxComponent

@export var health_component : HealthComponent

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D):
	if body is TileMapLayer:
		owner.health = 0.0
		owner.death()
