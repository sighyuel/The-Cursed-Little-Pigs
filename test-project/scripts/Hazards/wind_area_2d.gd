extends Area2D
class_name WindArea2d

@export var speed: Vector2 = Vector2.UP
var save_speed: Vector2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_object_entered)
	body_exited.connect(_object_exited)
	save_speed = speed


func _object_entered(object: Node2D) -> void:
	if "wind_velocity" in object:
		print("enter")
		object.wind_velocity += speed
		if speed.y < 0.0:
			object.velocity.y = speed.y
	if object.name == "Dale":
		speed = Vector2(0.0, 0.0)

func _object_exited(object: Node2D) -> void:
	if object.name == "Dale":
		speed = save_speed
	if "wind_velocity" in object:
		object.wind_velocity -= speed
		object.velocity.x = 0.0
