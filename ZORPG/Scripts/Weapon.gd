extends Node2D
class_name Weapon
@export var spawnPosition:Node2D
@export var bull : PackedScene
var collision_mask 
# Called when the node enters the scene tree for the first time.
func _ready():
	var c=get_parent() as CharacterBody2D
	collision_mask =c.collision_mask
	pass # Replace with function body.


func _fire():
	var space_state = get_world_2d().direct_space_state
	
	# use global coordinates, not local to node
	var from :Vector2 =spawnPosition.global_position;
	var angle = get_angle_to(spawnPosition.global_position)
	
	#var to :Vector2 =get_global_mouse_position()
	var to :Vector2= from+(global_position.direction_to(spawnPosition.global_position).normalized()*100)
	var query = PhysicsRayQueryParameters2D.create(from,to,collision_mask,[self])
	query.collide_with_areas =true;
	var result = space_state.intersect_ray(query)
	var target =null
	print ("Fired");
	#//queue_redraw()
	if result:
		target =result.collider as zombie
		to=result.position
		print(result.position)
		print(result.collider.name)
	
	var b=bull.instantiate() as bullet
	get_tree().root.add_child(b)
	b.fire(target, from,to)
	print("Finished");
func _draw():
	pass
	#draw_circle(V,1,Color.GREEN)
	#draw_circle((spawnPosition.global_position-global_position).normalized()*100 ,3,Color.RED)
