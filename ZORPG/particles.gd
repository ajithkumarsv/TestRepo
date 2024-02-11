extends GPUParticles2D
class_name Particle_hit

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _on_spawn(pos :Vector2):
	emitting=true
	print("particle spawned")
	global_position =pos
func _destroy():
	queue_free()
