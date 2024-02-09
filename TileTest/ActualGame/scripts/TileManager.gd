extends Node
class_name TileManager

static var instance :TileManager
func  _enter_tree():
	if instance!=null:
		queue_free()
		return
	instance =self
	
@export var tile_map :TileMap
var dict:Dictionary

# Called when the node enters the scene tree for the first time.
func _ready():
	var tiles=tile_map.get_used_cells_by_id(0);
	for t in tiles:
		if(tile_map.get_cell_tile_data(0,t).get_custom_data("can_place")):
			#print("setting true")
			dict[str_from_vec(t)] =TileInfo.new(null,true,true)
	
	
 #gets possible movement tiles for unit
func unit_movable_tile(un:unit)->Array[Vector2i]:
	var move_range:int=un.stats.movement
	var test_ar:Array[Vector2i]
	var x:Array[Vector2i] 
	#test_ar.append(InputManager.instance._get_tile_vector())
	x.append(InputManager.instance._get_tile_vector())
	var temp2:Array[Vector2i]
	for i in range(move_range):
		var temp =x.duplicate(false);
		x.clear();
		#print("Temp length",temp.size())
		for d in temp:
			var d1=Vector2i(d.x+1,d.y)
			if is_valid(d1):
				x.append(d1 )
			var d2= Vector2i(d.x-1,d.y)
			if is_valid(d2):
				x.append(d2)
			var d3=Vector2i(d.x,d.y+1)
			if is_valid(d3):
				x.append(d3)
			var d4= Vector2i(d.x,d.y-1)
			if is_valid(d4):
				x.append(d4)
		for t in x:
			if !test_ar.has(t) && is_valid(t):
				test_ar.append(t)
			
		print("Temp length",test_ar.size())
		#//x =tile_map.get_neighbor_cell(k,TileSet.CELL_NEIGHBOR_RIGHT_SIDE)
	test_ar.erase(InputManager.instance._get_tile_vector())
	return test_ar

#gets target locations for troops
func unit_attackable_tile(un:unit)->Array[Vector2i]:
	var attack_range:int=un.stats.attackRange
	var test_ar:Array[Vector2i]
	var x:Array[Vector2i] 
	#test_ar.append(InputManager.instance._get_tile_vector())
	x.append(InputManager.instance._get_tile_vector())
	var temp2:Array[Vector2i]
	for i in range(attack_range):
		var temp =x.duplicate(false);
		x.clear();
		#print("Temp length",temp.size())
		for d in temp:
			x.append(Vector2i(d.x+1,d.y) )
			x.append(Vector2i(d.x-1,d.y))
			x.append(Vector2i(d.x,d.y+1))
			x.append(Vector2i(d.x,d.y-1))
			
		for t in x:
			if !test_ar.has(t) && is_target(t):
				test_ar.append(t)
			
		print("Temp length",test_ar.size())
		#//x =tile_map.get_neighbor_cell(k,TileSet.CELL_NEIGHBOR_RIGHT_SIDE)
	test_ar.erase(InputManager.instance._get_tile_vector())
	return test_ar
	
func is_valid(pos:Vector2i)->bool:
	var v =str_from_vec(pos)
	if dict.has(v) && !dict[v].current_unit:
		return true
	else:
		return false

func is_target(pos:Vector2i)->bool:
	var v =str_from_vec(pos)
	if dict.has(v) && dict[v].current_unit:
		return true
	else:
		return false

func get_tile_info(pos:Vector2i)->TileInfo:
	var v =str_from_vec(pos)
	if dict.has(v):
		return dict[v]
	else:
		return null
	
func str_from_vec(pos:Vector2i)->String:
	return str(pos.x)+","+str(pos.y)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
