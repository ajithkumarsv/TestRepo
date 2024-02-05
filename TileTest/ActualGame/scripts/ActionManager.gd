extends Node
class_name ActionManager

static var instance :ActionManager
@export var sd :int =5

func  _enter_tree():
	if instance!=null:
		queue_free()
		return
	instance =self
	
	
func _ready():
	
	pass

func _process(delta):
	pass
