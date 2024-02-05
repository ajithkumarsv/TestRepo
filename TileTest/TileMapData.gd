extends TileMap
class_name TileSys
@export var tileMap:TileMap

@export var sp :Node2D
var x:int =0;
var astar_grid = AStarGrid2D.new()
@export var spawnManager :SpawnManager
var startPosition :Vector2
var endPosition :Vector2
var path :PackedVector2Array
var tileinfo :Dictionary
var canDraw =false
var selectedUnit :unit;
var selected_move_point :Array[Vector2]
var selectedMarker 
# Called when the node enters the scene tree for the first time.
func _ready():
	astar_grid.region=get_used_rect()
	astar_grid.cell_size=tile_set.tile_size
	astar_grid.get
	astar_grid.diagonal_mode=AStarGrid2D.HEURISTIC_MANHATTAN
	astar_grid.diagonal_mode=AStarGrid2D.DIAGONAL_MODE_NEVER
	astar_grid.update()
	astar_grid.fill_solid_region(astar_grid.region)
	var x =get_used_cells_by_id(0)
	for a in x:
		print(typeof(a));
		var tiledata =get_cell_tile_data(0,a)
		if tiledata != null :
			if  !tiledata.get_custom_data("canMove"):
				astar_grid.set_point_solid(a,true)
			else :
				tileinfo[str(a.x)+","+str(a.y)] ={"occupied": false ,"ispath" :true,"unit" :null}
				astar_grid.set_point_solid(a,false)
	
	
	#astar_grid.get_point_position()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_key_pressed(KEY_X) && selectedUnit:
		var t = local_to_map(get_global_mouse_position())
		var d;
		if tileinfo.has(str(t.x)+","+str(t.y)):
			d=tileinfo[str(t.x)+","+str(t.y)];
		var x=get_cell_tile_data(0,t)
		if(x!=null):
			if x.get_custom_data("canMove") && d!=null && !d["occupied"]:
				d["occupied"] =true;
				d["unit"] = selectedUnit
				var dd=local_to_map(selectedUnit.position)
				selectedUnit.position =map_to_local(t)
				
				var tt;
				print("move success");
				if tileinfo.has(str(dd.x)+","+str(dd.y)):
					tt=tileinfo[str(dd.x)+","+str(dd.y)];
					if tt!=null :
						tt["occupied"] =false
				
	if Input.is_action_just_pressed("leftmouse"):
		
		#sp.position=get_global_mouse_position()
		var t = local_to_map(get_global_mouse_position())
		var d;
		if tileinfo.has(str(t.x)+","+str(t.y)):
			d=tileinfo[str(t.x)+","+str(t.y)];
		var x=get_cell_tile_data(0,t)
		if(x!=null):
			if selectedUnit && x.get_custom_data("canMove") &&d!=null && !d["occupied"]:
				d["occupied"] =true;
				d["unit"] = selectedUnit
				var dd=local_to_map(selectedUnit.position)
				selectedUnit.position =map_to_local(t)
				var tt;
				print("move success");
				if tileinfo.has(str(dd.x)+","+str(dd.y)):
					tt=tileinfo[str(dd.x)+","+str(dd.y)];
					if tt!=null :
						tt["occupied"] =false
				pass
			if d!=null && d["occupied"] && d["unit"]!=null :
				if(selectedUnit == null):
					selectedUnit = d["unit"]
					var ta=selectedUnit.stats.movement
					var a:Array
					for i in range(0,ta):
						var gfg=local_to_map(selectedUnit.position) ;
						a.append(gfg+Vector2i(1,0))
						a.append(gfg+Vector2i(-1,0))
						a.append(gfg+Vector2i(0,1))
						a.append(gfg+Vector2i(0,-1))
					selectedUnit._selected()
					
				elif selectedUnit == d["unit"]:
					selectedUnit._unselected()
					selectedUnit =null
				print("unit selected");
			elif selectedUnit ==null && x.get_custom_data("canMove") &&d!=null && !d["occupied"]:
				d["unit"]=spawnManager._spawn_unit(0,map_to_local(t))
				d["occupied"] =true;
				
		#set_cell(0,t,0,Vector2(2,0),0);
		#x+=1;
		startPosition =t;
		
		print(t);
		
	if Input.is_action_just_pressed("rightmouse"):
		var x=get_cell_tile_data(0,local_to_map(get_global_mouse_position()))
		if(x!=null):
			endPosition =local_to_map(get_global_mouse_position())
			path=astar_grid.get_point_path(startPosition,endPosition)
			print(x.get_custom_data("CanPlace"));
			path=astar_grid.get_id_path(startPosition,endPosition)
			if(path):
				print(path)
				canDraw =true
				queue_redraw()
				
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_MIDDLE):
		var x=get_cell_tile_data(0,local_to_map(get_global_mouse_position()))
		if(x!=null):
			x.set_custom_data("CanPlace",false);
	if Input.is_key_pressed(KEY_A):
		print("saving")
		if(ResourceSaver.save(tile_set,"tes",0)):
			print ("savde success");
			
		
func _draw():
	print("Dawing")
	if path !=null and canDraw:
		
		for i in path:
			draw_circle(map_to_local(i),3,Color.AQUA)
			
		canDraw= false	
		draw_rect(Rect2(startPosition,Vector2(10,10)), Color.GREEN_YELLOW)
		draw_rect(Rect2(endPosition,Vector2(10,10)), Color.GREEN_YELLOW)
