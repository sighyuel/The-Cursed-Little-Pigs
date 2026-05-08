extends StaticBody2D

@onready var animate = $AnimationPlayer

func _on_area_2d_body_entered(body: Node2D) -> void:
	animate.play("platform_moving")


func _on_area_2d_body_exited(body: Node2D) -> void:
	animate.pause()
