extends Node

@export_file var mainmenuscene :String


func _ready():
	call_deferred("_loadscene");
	#//_loadscene()
	
func _loadscene():
	#var scene =ResourceLoader.load_threaded_get(mainmenuscene)
	print ("load scene")
	var a=ResourceLoader.load_threaded_request(mainmenuscene)
	
	



