extends StaticBody3D

signal lever_in_range
signal lever_not_in_range
# Called when the node enters the scene tree for the first time.

func _on_area_3d_body_entered(body):
	lever_in_range.emit()
	print ("var changed")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass






func _on_area_3d_body_exited(body):
	lever_not_in_range.emit()
	print("var changed back")


func _on_test_character_camera_kill_waterfall():
	$AnimationPlayer_Lever.play("lever_ani")
