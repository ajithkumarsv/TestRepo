extends CanvasLayer

@export var fps:Label
# Called when the node enters the scene tree for the first time.

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var x = "FPS"+str(Engine.get_frames_per_second())
	fps.text = x
