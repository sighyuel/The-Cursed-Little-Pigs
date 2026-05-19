extends Node

@onready var active = 1



func _process(_delta):
	if Input.is_action_just_pressed("Right Bumper"):
		if active != 3:
			active += 1
		else:
			active = 1
	if Input.is_action_just_pressed("Left Bumper"):
		if active != 1:
			active -= 1
		else:
			active = 3

func map_value(n, min1, max1, min2, max2):
	return ((n - min1) * (max2 - min2)) / (max1 - min1) + min2
	
