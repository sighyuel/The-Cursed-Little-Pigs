extends character

@onready var interaction_area: InteractionArea = $InteractionArea

func _ready():
	interaction_area.interact = Callable(self, "_on_interact")

func _physics_process(delta: float) -> void:
	move_and_slide()
	rect.visible = false
	if not is_on_floor():
		velocity.y += gravity * delta
	if is_on_floor():
		gravity = 980
	if active == 3:
		rect.visible = true
		_movement()
		_may_glide()
		

func _on_interact():
	print("attach")
