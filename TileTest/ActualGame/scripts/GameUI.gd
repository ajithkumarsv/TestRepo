class_name GameUI extends Control
static var instance :GameUI
func  _enter_tree():
	if instance!=null:
		queue_free()
		return
	instance =self

@export var scrol_container:UnitScrollContainer
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _remove_sprite_ui(index:int):
	scrol_container._remove_item(index)
	
func _update_sprite_ui(index:int,texture:Texture2D):
	printerr("called Change image",texture)
	scrol_container._add_item(index,texture)
	pass
	
func selected(id :int):
	PlayerManager.instance.current_selected_unit(id);
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
