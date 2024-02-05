extends Node
class_name AIManager

static var instance :AIManager
func  _enter_tree():
	if instance!=null:
		queue_free()
		return
	instance =self
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
