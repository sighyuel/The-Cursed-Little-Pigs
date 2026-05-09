extends StaticBody2D

@onready var animate = $AnimationPlayer

func _on_area_2d_body_entered(body: Node2D) -> void:
	if "platform_speed" in body:
		pass
		#body.platform_speed = animate.speed_scale
	animate.play("platform_moving")




func _on_area_2d_body_exited(body: Node2D) -> void:
	animate.pause()
