extends Control

var progress = []
var sceneName
var sceneloadstatus = 0

func _ready():
	sceneName = "res://ScenesandScripts/Levels/level_1.tscn"
	ResourceLoader.load_threaded_request(sceneName)



func _process(_delta):
	sceneloadstatus = ResourceLoader.load_threaded_get_status(sceneName,progress)
	$ColorRect/LoadPercent.text = str(floor(progress[0]*100)) + "%"
	if sceneloadstatus == ResourceLoader.THREAD_LOAD_LOADED:
		var newScene = ResourceLoader.load_threaded_get(sceneName)
		get_tree().change_scene_to_file(sceneName)
