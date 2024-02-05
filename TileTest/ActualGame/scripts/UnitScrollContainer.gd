class_name UnitScrollContainer extends ScrollContainer


@export var item_prefab:PackedScene
var unit_cells:Array[UnitCell]

var gameui: GameUI
var dict :Dictionary

func _ready():
	gameui =GameUI.instance

func _remove_item(index:int):
	if dict.has(index):
		var x:int=dict[index]["count"]
		x-=1;
		dict[index]["count"]=x
		dict[index]["unit_cell"]._add_number(x)
		if x==0:
			dict.erase(index)
	#for i in unit_cells:
		#if i.id ==index:
			#i.queue_free()
			#unit_cells.erase(i)
			#break
	
func _add_item(index:int,texture:Texture2D):
	if dict.has(index):
		var x:int=dict[index]["count"]
		x+=1;
		dict[index]["count"]=x
		dict[index]["unit_cell"]._add_number(x)
	else:
		var item=item_prefab.instantiate() as UnitCell
		#item.button_down.connect(_on_presesed)    
		item.on_selected_unit.connect(_on_presesed)
		unit_cells.append( item)
		$HBoxContainer.add_child(item)
		item._changeImage(index,texture)
		dict[index] = {"count":1,"unit_cell":item}

func _on_presesed(id :int):
	if(id==-1):gameui.selected(-1)
	else :gameui.selected(id)
	pass
	
