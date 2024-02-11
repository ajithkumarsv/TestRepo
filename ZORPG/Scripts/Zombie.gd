extends CharacterBody2D
class_name zombie
var target :Node2D
@export var speed = 30.0
var isDead=false
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _process(delta):
	if target == null: return
	# Add the gravity.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction =  (target.global_position -global_position).normalized()
	if direction:
		velocity = direction * speed *delta
	move_and_slide()

func  _onDead():
	if(isDead): return
	isDead =true
	queue_free()
	print("zombie dead")


func _on_player_notifier_body_entered(body):
	print("Entered.. ",body.name)
	target =body as Node2D


func _on_player_notifier_body_exited(body):
	print("Exited... ",body.name)
