class_name TileInfo 

var current_unit:unit
var is_slot_free:bool
var can_move:bool

func _init(current_unit:unit,is_slot_free :bool,can_move:bool):
	self.current_unit =current_unit
	self.is_slot_free =is_slot_free
	self.can_move=can_move
	
