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
var active_unit:unit=null

func _ready():
	unit_manager =UnitManager.instance
	for i in range(10):
		var created_unit   = unit_manager.friendly_units[randi_range(0,unit_manager.friendly_units.size()-1)].instantiate() as unit 
		available_units.append(created_unit)
		GameUI.instance._update_sprite_ui(created_unit.id,created_unit.get_child(0).texture)
	

func current_selected_unit(id :int)->bool:
	#if(id<0) :
		#selected_unit=null
		#return
	
	for i in available_units:
		if i.id== id:
			printerr("searching for units",id)
			selected_unit =i
			#available_units.erase(i)
			return true
	return false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
		
func _unhandled_input(event):
	if Input.is_action_just_pressed("leftmouse") :
		var data=InputManager.instance.tile_info
		#print("point 1",data,data.can_move)
		if data && data.current_unit :
			active_unit =data.current_unit
			var x:Array[Vector2i]=check_movablepos(active_unit)
			InputManager.instance.draw_Path(x)
			InputManager.instance.redraw()
			printerr("selected unit")
		if selected_unit:
			if data && data.can_move :
				data.can_move= false
				available_units.erase(selected_unit)
				get_tree().root.add_child(selected_unit);
				selected_unit.global_position =InputManager.instance._get_mouse_world_pos()
				GameUI.instance._remove_sprite_ui(selected_unit.id)
				placed_units.append(selected_unit);
				data.current_unit=selected_unit
				if(!current_selected_unit(selected_unit.id)):
					selected_unit =null

func check_movablepos(un:unit)->Array[Vector2i]:
	return TileManager.instance. unit_attackable_tile(un)
	#return TileManager.instance.unit_movable_tile(un)
	
	
func check_attackablepos(un:unit):
	pass

			
