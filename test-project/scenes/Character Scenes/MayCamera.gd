extends Camera2D

@export var max_shake : float = 10.0
@export var shake_fade : float = 10.0

var _shake_strength : float = 0.0

func trigger_shake() -> void:
	_shake_strength = max_shake

func _process(delta: float) -> void:

	var p =  $".."
	#Lerps the offset for each pig while falling
	if not p.is_on_floor() and p.velocity.y > 600:
		offset.y = lerp(offset.y, 75.0, 40.0 * delta)
	else:
		offset.y = lerp(offset.y, -75.0, 40.0 * delta)
	if _shake_strength > 0:
		_shake_strength = lerp(_shake_strength, 0.0, shake_fade * delta)
		offset = Vector2(randf_range(-_shake_strength, _shake_strength), randf_range(-_shake_strength, _shake_strength))
