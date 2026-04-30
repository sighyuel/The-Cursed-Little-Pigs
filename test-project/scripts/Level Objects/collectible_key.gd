extends Area2D

var _coin_count: int

func _ready() -> void:
	GlobalSignals.connect("coin_collect",_coin_collect)

func _coin_collect() -> void:
	_coin_count += 1

func _coin_complete() -> void:
	if _coin_count == 3:
		get_tree().call_deferred("reload_current_scene")

func _on_body_entered(body: Node2D) -> void:
	if body is Node2D:
		GlobalSignals.coin_collect.emit()
	_coin_complete() 
	queue_free()
