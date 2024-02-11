
extends Resource
class_name  stat
@export var health: int
@export var movement:int
@export var movable :bool
@export var attackRange :int
@export var troop_type: global_use.troop_type
@export var troop_team: global_use.troop_team
@export var actions: int

func _init(p_health = 0,):
	health = p_health
