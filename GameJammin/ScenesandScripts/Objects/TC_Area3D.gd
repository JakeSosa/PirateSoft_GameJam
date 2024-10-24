extends Area3D

var entered_TC = false

var sceneTwo = preload("res://ScenesandScripts/Levels/level_1_scene_animation_tree.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if entered_TC == true:
		get_tree().change_scene_to_file(sceneTwo)


func _on_body_entered(body: Node3D) -> void:
	entered_TC = true


func _on_body_exited(body: Node3D) -> void:
	entered_TC = false
