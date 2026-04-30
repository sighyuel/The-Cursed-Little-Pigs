extends CharacterBody2D
class_name character

#region export variables
@export var health : int
@export var piggy : String
@export var collision : CollisionShape2D

#for now, use the character mesh
@export var charMesh : MeshInstance2D

#use sprite once we have sprites
@export var sprite : Sprite2D
@export var JUMP_VELOCITY = 300.0
@export var acceleration = 30.0
#endregion

#region onready variables
#calling the nodes here so they arent called constantly
@onready var charCol = $charCol
@onready var mesh = $mesh
@onready var rect = $Indicator
@onready var ladder_detection_ray: RayCast2D = $ladder_detect_ray
#endregion

var speed = 0.0
var max_height = 6
var max_sprite_height = 115
var tree_reset_height = 60
var glide = .0001
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")
var move_dir = 0.0
#variables for abilities
var tree_mode_activated = false
var may_is_flying = false
var dale_ground_pounding = false
#wind variable that moves our characters
var wind_velocity: Vector2 = Vector2.ZERO
#controls how fast may glides down
var glide_fall : int = 100
#controls how high perry's ladder can go
var max_ladder_height : int = 10

#region ladder variables
#Ladder variables
var on_ladder: bool = false
var _on_ladder : bool = false
var _ladder_x_pos : float
var _ladder_snap_weight : float = 10.0
@export var ladder_speed : float = -20.0
#endregion



func _ready():
	add_to_group("character")
	_on_ladder = false
	#room change logic
	if RoomChangeGlobal.Activate:
		global_position = RoomChangeGlobal.PlayerPos
		if RoomChangeGlobal.PlayerJumpOnEnter:
			velocity.y = -JUMP_VELOCITY
		RoomChangeGlobal.Activate = false



#region ladder stuff

#using the raycast to detect if it is colliding or not
func _is_on_ladder() -> bool:
	if not ladder_detection_ray.is_colliding():
		return false
	
	_ladder_x_pos = ladder_detection_ray.get_collider().global_position.x
	return true

#controls the movement of the ladder
func ladder_movement(delta : float) -> void:
	global_position.x = lerp(global_position.x, _ladder_x_pos,_ladder_snap_weight * delta)
	var direction : float = Input.get_axis("ui_down","ui_up")
	var direction_x : float = Input.get_axis("ui_left","ui_right")
	velocity.x = 0.0
	
	if direction_x and Input.is_action_just_pressed("A"):
		velocity.x = ladder_speed * direction
	
	if direction:
		velocity.y = ladder_speed * direction
	else:
		velocity.y = 0.0
		
#endregion

#region movement for pigs

#basic movement for all piggies
func _movement(_delta: float):
	move_dir = Input.get_axis("ui_left","ui_right")

	speed = move_dir * acceleration
	global_position.x += speed

	#aka jump
	if is_on_floor():
		if Input.is_action_just_pressed("A"):
			velocity.y = -JUMP_VELOCITY
#endregion

#region death function
func death():
	if health == 0.0:
		get_tree().call_deferred("reload_current_scene")
#endregion

#region abilities for pigs
#perry's ability
func _perry_stretch():
	if Input.is_action_pressed("Y"):
		mesh.scale.y += 5
		charCol.scale.y += .3
		rect.position.y = -15
		$Ladder.scale.y += .5
		#acceleration -= 1


	if charCol.scale.y >= max_height and mesh.scale.y >= max_sprite_height and $Ladder.scale.y >= max_ladder_height:
		charCol.scale.y = max_height
		mesh.scale.y = max_sprite_height
		$Ladder.scale.y = max_ladder_height
		tree_mode_activated = true

#resets perry back to original height
func _perry_reset():
	if Input.is_action_just_pressed("B"):
		mesh.scale.y = 21
		charCol.scale.y = 1
		acceleration = 3
		JUMP_VELOCITY = 400.0
		global_position.y -= tree_reset_height
		rect.position.y = -10
		$Ladder.scale.y = 1
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
func _may_glide(delta):
	if Input.is_action_pressed("Y") and not is_on_floor():
		velocity.y += gravity * delta
		if velocity.y >= glide_fall:
			velocity.y = glide_fall
#endregion
