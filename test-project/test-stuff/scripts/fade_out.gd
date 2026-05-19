extends Label
@export var fade_duration = 5.0
@export var starting_value = 1.0
@export var ending_value = 0.0
func _ready() -> void:
	await fade_out()

func fade_out() -> void:
	var t = get_tree().create_tween()
	t.tween_property(self,"modulate:a", ending_value,fade_duration).from(starting_value)
	await t.finished
