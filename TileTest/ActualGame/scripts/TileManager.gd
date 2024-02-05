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
			print("setting true")
			dict[str_from_vec(t)] =TileInfo.new(null,true,true)
	pass # Replace with function body.


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
