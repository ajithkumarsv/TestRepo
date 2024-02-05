extends Node2D
class_name unit
@export var stats :stat 

@export var id:int=100
var selected:bool =false
var move_target_positions  :Array[Vector2]
var tween:Tween
@onready var sprite_texture :Texture2D =$Sprite2D.texture
func _ready():
	tween= get_tree().create_tween()
	_front();
	_unselected();
	
	pass # Replace with function body.func

func _front():
	tween.tween_property(self,"scale",Vector2(0.5,1),0.4).set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN);
	tween.tween_property(self,"scale",Vector2(1,1),0.4).set_trans(Tween.TRANS_CIRC).set_ease(Tween.EASE_IN);
	tween.set_loops(-1)
	#tween.tween_callback(_back)
func _selected():
	tween.play();
	pass
func _unselected():
	tween.pause();
	scale=Vector2(1,1)
	pass


func _process(delta):
	pass
