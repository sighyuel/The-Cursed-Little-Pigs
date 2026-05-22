extends Camera2D
@export var zoom_reset := Vector2(1.0,1.0)
@export var offset_y: float =  -75.0
@export var min_camera_zoom := Vector2(0.4, 0.4)
@export var zoom_out := Vector2(.006, .006)

func _physics_process(delta: float) -> void:
	var p =  $".."
	#Lerps the offset for each pig while falling
	if not p.is_on_floor() and p.velocity.y > 705:
		offset.y = lerp(offset.y, 75.0, 40.0 * delta)
	else:
		offset.y = lerp(offset.y, -75.0, 40.0 * delta)

func _perry_stretch():
	drag_top_margin = 0.65
	zoom -= zoom_out
	if zoom < min_camera_zoom:
		zoom = min_camera_zoom

func _perry_reset():
	zoom = zoom_reset
	drag_vertical_offset = 0.0
