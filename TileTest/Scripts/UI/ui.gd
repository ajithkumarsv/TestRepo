extends Control

@export
var button :PackedScene
@export var button_container :Node
@export var width:int
@export var height:int
@export var fps:Label
@export var Tileset: Texture
# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(0,10):
		var x =button.instantiate()
		button_container.add_child(x)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var x = "FPS"+str(Engine.get_frames_per_second())
	fps.text = x
	pass
