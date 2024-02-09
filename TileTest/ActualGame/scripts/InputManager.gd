class_name InputManager extends Node2D

#singleton
static var instance :InputManager

func  _enter_tree():
	if instance!=null:
		queue_free()
		return
	instance =self
	
var tile_map: TileMap
var can_select :bool =true
var tile_vector:Vector2i =Vector2.ZERO
var tile_info :TileInfo=null
@export var selection_sprite:Node2D
static  var current_data:TileData=null
@export var font:Font
var arr:Array[Vector2]

# Called when the node enters the scene tree for the first time.
func _ready():
	tile_map =TileManager.instance.tile_map

func _get_mouse_world_pos()->Vector2:
	return tile_map.map_to_local(tile_vector)
	
func _get_tile_vector()->Vector2i:
	return tile_vector
	
func _get_tileInfo()->TileInfo:
	return tile_info
	
func _unhandled_input(event):
	#if !can_select :return
	
	tile_vector=tile_map.local_to_map( get_global_mouse_position())
	tile_info =TileManager.instance.get_tile_info(tile_vector)

func redraw():
	queue_redraw()
	
func draw_Path(ar:Array[Vector2i]):
	arr.clear()
	
	for i in ar:
		
		arr.append(tile_map.map_to_local(i))
	
func _draw():
	for i in arr:
		draw_circle(i,2,Color.GREEN)
		#draw_string(font,tile_map.map_to_local(i),str(i.x)+":"+str(i.y),HORIZONTAL_ALIGNMENT_CENTER,200,10,)
	
