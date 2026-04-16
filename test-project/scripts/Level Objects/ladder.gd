extends Area2D
class_name Ladder

var on_ladder: bool
var is_climbing: bool
# Called when the node enters the scene tree for the first time.



# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_body_entered(_body: Node2D) -> void:
	on_ladder = true



func _on_body_exited(_body: Node2D) -> void:
	on_ladder = false
	print("i've left the ladder") # Replace with function body.
