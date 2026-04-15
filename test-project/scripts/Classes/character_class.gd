extends CharacterBody2D
class_name character

#global variables
@export var piggy : String
@export var collision : CollisionShape2D
#for now, use the character mesh
@export var charMesh : MeshInstance2D
#use sprite once we have sprites
@export var sprite : Sprite2D
@export var MAX_VELOCITY = 30.0
@export var JUMP_VELOCITY = 300.0
@export var acceleration = 30.0
@onready var active = 1
#calling the nodes here so they arent called constantly
@onready var charCol = $charCol
@onready var mesh = $mesh
@onready var rect = $Indicator
var speed = 0.0
var max_height = 15
var max_sprite_height = 300
var glide = .0001
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var move_dir = 0.0
var tree_mode_activated = false
var may_is_flying = false
var dale_ground_pounding = false

func _ready():
	add_to_group("character")

func _process(_delta: float):
	if Input.is_action_just_pressed("Right Bumper"):
		if active != 3:
			active += 1
		else:
			active = 1

#basic movement for all piggies
func _movement():
	move_dir = Input.get_axis("ui_left","ui_right")
	speed = move_dir * acceleration
	global_position.x += speed
	#aka jump
	if Input.is_action_just_pressed("A") and is_on_floor():
		velocity.y = -JUMP_VELOCITY


#perry's ability
func _perry_stretch():
	if Input.is_action_pressed("Y"):
		mesh.scale.y += 20
		charCol.scale.y += 1
		acceleration -= 1

	if charCol.scale.y >= max_height and mesh.scale.y >= max_sprite_height:
		charCol.scale.y = max_height
		mesh.scale.y = max_sprite_height
		JUMP_VELOCITY = 500.0
		tree_mode_activated = true

func _perry_reset():
	if Input.is_action_just_pressed("B"):
		mesh.scale.y = 19.75
		charCol.scale.y = 1
		acceleration = 5
		JUMP_VELOCITY = 300.0

#our favorite pig(dale)'s abilities
func _dale_slam():
	if Input.is_action_pressed("Y") and not is_on_floor():
		global_position.y += 10
		mesh.scale.x += 2
		dale_ground_pounding = true
	else:
		dale_ground_pounding = false
		mesh.scale.x = 42

#may's abilities
func _may_glide():
	if Input.is_action_pressed("Y") and not is_on_floor():
		velocity.y += gravity * glide
		gravity = 100
