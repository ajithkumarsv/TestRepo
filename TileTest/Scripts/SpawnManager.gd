extends Node2D
class_name SpawnManager
var unit :Node
@export var unitArray :Array[PackedScene]
@export var spawnedUnits :Array[unit]
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_1):
		_spawn_unit(1)
	elif  Input.is_key_pressed(KEY_2):
		_spawn_unit(2)
	elif  Input.is_key_pressed(KEY_3):
		_spawn_unit(3)
		
	elif  Input.is_key_pressed(KEY_4):
		_spawn_unit(4)
	elif  Input.is_key_pressed(KEY_5):
		_spawn_unit(5)
	elif  Input.is_key_pressed(KEY_6):
		_spawn_unit(0)
	

func _spawn_unit(x:int,pos :Vector2 =Vector2.ZERO) -> unit:
	print ("spawning ",x);
	var tr=unitArray[x].instantiate()
	spawnedUnits.append(tr)
	tr=tr as unit
	tr.position=pos
	add_child(tr)
	return tr;
	
