extends Area2D
class_name HitboxComponent

# Called when the node enters the scene tree for the first time.
@export var health_component : HealthComponent


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D):
	if body.name == "Dale":
		body.queue_free()
