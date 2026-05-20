extends Camera2D


func _physics_process(delta: float) -> void:
	var p =  $".."
	#Lerps the offset for each pig while falling
	if not p.is_on_floor() and p.velocity.y > 705:
		offset.y = lerp(offset.y, 75.0, 40.0 * delta)
	else:
		offset.y = lerp(offset.y, -75.0, 40.0 * delta)
