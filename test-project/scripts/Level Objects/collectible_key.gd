extends Area2D

var _coin_count: int
@onready var timer = $Timer_crystal
@onready var crystal_sound = $Sounds/CrystalCollect
@onready var wolf_screaming = $Sounds/WolfScreaming
@onready var crystal_anim = $AnimatedSprite2D

func _ready() -> void:
	GlobalSignals.connect("coin_collect",_coin_collect)
	set_process(false)

func _coin_collect() -> void:
	wolf_screaming.play()
	crystal_sound.play()
	set_process(true)
	_coin_count += 1

func _coin_complete() -> void:
	if _coin_count == 3:
		get_tree().call_deferred("reload_current_scene")

func _on_body_entered(body: Node2D) -> void:
	if body is Node2D:
		set_process(true)
		timer.start(1.5)
		crystal_anim.play("crystal_break")
		GlobalSignals.coin_collect.emit()
	_coin_complete() 

func _on_timer_crystal_timeout() -> void:
	queue_free()
