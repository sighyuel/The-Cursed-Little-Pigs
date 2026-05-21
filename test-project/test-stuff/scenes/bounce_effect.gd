extends Button

var tween: Tween

func _on_focus_entered() -> void:
	reset_tween()
	tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween.tween_property(self,"scale", Vector2(0.2,0.22),0.4) # Replace with function body.

func _on_focus_exited() -> void:
	reset_tween()
	tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_ELASTIC)
	tween.tween_property(self,"scale",Vector2(0.2,0.2),0.4)

func reset_tween() -> void:
	if tween:
		tween.kill()
	tween = create_tween()
