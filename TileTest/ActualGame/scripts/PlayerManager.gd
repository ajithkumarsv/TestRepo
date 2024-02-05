class_name PlayerManager extends Node

static var instance :PlayerManager
func  _enter_tree():
	if instance!=null:
		queue_free()
		return
	instance =self

var unit_manager :UnitManager
var available_units :Array[unit]
var placed_units :Array[unit]
var selected_unit:unit=null

func _ready():
	unit_manager =UnitManager.instance
	
	for i in range(50):
		var created_unit   = unit_manager.friendly_units[randi_range(0,unit_manager.friendly_units.size()-1)].instantiate() as unit 
		available_units.append(created_unit)
		GameUI.instance._update_sprite_ui(created_unit.id,created_unit.get_child(0).texture)
	

func current_selected_unit(id :int):
	if(id<0) :
		selected_unit=null
		return
	for i in available_units:
		if i.id== id:
			selected_unit =i
			#available_units.erase(i)
			break
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
func _unhandled_input(event):
	if Input.is_action_just_pressed("leftmouse") and selected_unit:
		var data=InputManager.instance.tile_info
		#print("point 1",data,data.can_move)
		if data && data.can_move :
			printerr("point 2")
			data.can_move= false
			available_units.erase(selected_unit)
			get_tree().root.add_child(selected_unit);
			selected_unit.global_position =InputManager.instance._get_mouse_world_pos()
			GameUI.instance._remove_sprite_ui(selected_unit.id)
			placed_units.append(selected_unit);
			selected_unit =null
		
			
