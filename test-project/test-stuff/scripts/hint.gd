extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body is character:
		$Label.visible = true # Replace with function body.


func _on_body_exited(body: Node2D) -> void:
	$Label.visible = false # Replace with function body.
