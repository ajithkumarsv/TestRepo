extends CharacterBody2D

@export var SPEED = 300.0
@export var gun_rot_speed =10
@export var gun :Weapon

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
#func _ready():
	#frame
func _physics_process(delta):
	pass
func  _process(delta):
	var direction = Vector2(Input.get_axis("ui_left", "ui_right"),Input.get_axis("ui_up", "ui_down"))
	velocity = direction * SPEED *delta
	move_and_slide()
	var mouse_pos =get_global_mouse_position();
	if(Input.is_action_just_pressed("fire")):
		gun._fire()
	var angle=get_angle_to(mouse_pos)
	gun.global_rotation =rotate_toward(gun.rotation,angle,delta*gun_rot_speed)
	#gun_point.rotate()
