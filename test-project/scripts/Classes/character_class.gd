extends CharacterBody2D
class_name character

#global variables
@export var health : int
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
var max_height = 7
var max_sprite_height = 150
var glide = .0005
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var move_dir = 0.0
var tree_mode_activated = false
var may_is_flying = false
var dale_ground_pounding = false
var on_ladder: bool = false
var coin_counter = 0
var tree_reset_height = 60
@onready var ladder_detection_ray: RayCast2D = $ladder_detect_ray
var _on_ladder : bool = false
var _ladder_x_pos : float
var _ladder_snap_weight : float = 10.0
@export var ladder_speed : float = -20.0

func _ready():
	add_to_group("character")
	_on_ladder = false

func _process(_delta):
	if Input.is_action_just_pressed("Right Bumper"):
		if active != 3:
			active += 1
		else:
			active = 1


func _is_on_ladder() -> bool:
	if not ladder_detection_ray.is_colliding():
		return false
	
	_ladder_x_pos = ladder_detection_ray.get_collider().global_position.x
	return true

func ladder_movement(delta : float) -> void:
	global_position.x = lerp(global_position.x, _ladder_x_pos,_ladder_snap_weight * delta)
	var direction : float = Input.get_axis("ui_down","ui_up")
	velocity.x = 0.0
	
	if direction:
		velocity.y = ladder_speed * direction
	else:
		velocity.y = 0.0
		



func set_count(new_coin_count: int) -> void:
	coin_counter = new_coin_count

func death():
	if health <= 0:
		queue_free()
		
		
		
#basic movement for all piggies
func _movement(_delta: float):
	move_dir = Input.get_axis("ui_left","ui_right")
	speed = move_dir * acceleration
	global_position.x += speed
	#aka jump
	if is_on_floor():
		if Input.is_action_just_pressed("A"):
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
	if Input.is_action_just_pressed("B") and tree_mode_activated:
		mesh.scale.y = 19.75
		charCol.scale.y = 1
		acceleration = 5
		JUMP_VELOCITY = 300.0
		global_position.y -= tree_reset_height
		tree_mode_activated = false

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
		velocity.y = gravity * glide
		gravity = 100
