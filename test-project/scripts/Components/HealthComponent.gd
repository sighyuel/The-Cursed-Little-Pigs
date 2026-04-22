extends Node2D
class_name HealthComponent
# still figuring out how to use this
@export var MAX_HEALTH := 10.0
var health : float

func _ready():
	health = MAX_HEALTH
	
func death():
	if health <= 0:
		queue_free()
