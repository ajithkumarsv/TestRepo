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

var playing_team :global_use.playing_team = global_use.playing_team.NONE

func _ready():
	pass 

func _on_unit_move():
	pass

func _on_player_turn_end():
	
	pass

func _on_ai_turn_end():
	
	pass
