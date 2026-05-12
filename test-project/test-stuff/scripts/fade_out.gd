extends Label

func _ready() -> void:
	await fade_out()

func fade_out() -> void:
	var t = get_tree().create_tween()
	t.tween_property(self,"modulate:a", 0.0,5).from(5.0)
	await t.finished
