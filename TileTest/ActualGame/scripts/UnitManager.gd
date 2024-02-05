extends Node
class_name UnitManager
static var instance :UnitManager
func  _enter_tree():
	if instance!=null:
		queue_free()
		return
	instance =self
	

@export var friendly_units :Array[PackedScene]
@export var enemy_units :Array[PackedScene]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
