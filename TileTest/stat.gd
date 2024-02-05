
extends Resource
class_name  stat
@export var health: int
@export var movement:int
@export var movable :bool
@export var attackRange :int
@export var troop_type: public_enums.troop_type
@export var troop_team: public_enums.troop_team

func _init(p_health = 0,):
	health = p_health
