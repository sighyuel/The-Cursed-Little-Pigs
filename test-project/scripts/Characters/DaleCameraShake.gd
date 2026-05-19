extends Camera2D

@export var max_shake : float = 10.0
@export var shake_fade : float = 10.0

var _shake_strength : float = 0.0

func trigger_shake() -> void:
	_shake_strength = max_shake

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(position_smoothing_speed)
	var p =  $".."
#	lerp the offset.y like this: offset.y = lerp(offset.y, [end value], weight (a variable * delta))
#	for instance using the delta
	if not p.is_on_floor():
		offset.y = lerp(offset.y, 75.0, 40.0 * delta)
		#offset.y = 75.0
	else:
		offset.y = lerp(offset.y, -75.0, 40.0 * delta)
		#offset.y = -75.0
	if _shake_strength > 0:
		_shake_strength = lerp(_shake_strength, 0.0, shake_fade * delta)
		offset = Vector2(randf_range(-_shake_strength, _shake_strength), randf_range(-_shake_strength, _shake_strength))
