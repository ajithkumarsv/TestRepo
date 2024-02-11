extends Node2D
class_name bullet
@export var speed =300
@export var particles :PackedScene
var direction
var tween
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func fire( target :zombie,from: Vector2,to : Vector2):
	var distance=from.distance_to(to)
	look_at(to)
	tween= get_tree().create_tween().bind_node(self)
	position =from
	tween.tween_property(self,"position",to,0.001 *distance)
	tween.tween_callback(finished.bind(target))
	tween.tween_callback(queue_free)

func finished(target:zombie):
	var particle =particles.instantiate() as Particle_hit
	get_tree().root.add_child(particle)
	particle._on_spawn(global_position)
	if(target):target._onDead()
	#
	#print ("niamation finished")

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
