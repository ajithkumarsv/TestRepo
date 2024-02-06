class_name UnitCell extends TextureButton


signal on_selected_unit(unit_id:int)
var id:int =0
var count:int 
@onready var selected:TextureRect =$Selected
@export var label:Label 

func _changeImage(id:int, texture:Texture2D):
	texture_normal=texture
	self.id=id;
	_add_number(1)

func _add_number(count:int):
	self.count=count
	label.text=str(self.count)
	

func _on_button_down():
	on_selected_unit.emit(id)


func _on_selected_focus_entered():
	printerr("enter")
	on_selected_unit.emit(id)
	selected.visible=true


func _on_selected_focus_exited():
	printerr("exit")
	on_selected_unit.emit(-1)
	selected.visible=false
