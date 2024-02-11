class_name unit extends Node2D

@export var stats :stat 
@export var id:int=100
var currenthealth:int;
var current_actions:int;
var selected:bool =false
var move_target_positions  :Array[Vector2]
var tween:Tween
@onready var sprite_texture :Texture2D =$Sprite2D.texture

func _ready():
	currenthealth = stats.health
	current_actions=stats.actions
	tween= get_tree().create_tween()
	_front();
	_unselected();
	pass

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

func _on_attack():
	pass
func _on_action_reset():
	current_actions =stats.actions
	
func _on_action_used(action_cost:int =1):
	current_actions-=action_cost
	
func _on_damage():
	print("damaged")

func _on_dead():
	print("unitDead")
	

