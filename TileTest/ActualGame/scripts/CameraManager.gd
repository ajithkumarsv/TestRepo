class_name CameraManager extends Camera2D

static var instance :CameraManager
func  _enter_tree():
	if instance!=null:
		queue_free()
		return
	instance =self
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var zoomX = Input.get_action_strength("ui_up")-Input.get_action_strength("ui_down")
	var zoomY = Input.get_action_strength("ui_right")-Input.get_action_strength("ui_left")
	#zoom = Vector2(zoom.x+zoomX,zoom.y +zoomX)
	position = Vector2(position.x+zoomY,position.y-zoomX)
	var mousepos=get_local_mouse_position()
	printerr("mousepos",mousepos)
