extends StaticBody3D

signal leverEnterCheck
signal leverExitCheck
# Called when the node enters the scene tree for the first time.


func _on_lever_body_entered(body):
	leverEnterCheck.emit()
	print ("var changed")


func _on_lever_body_exited(body):
	leverExitCheck.emit()
	print("var changed back")
