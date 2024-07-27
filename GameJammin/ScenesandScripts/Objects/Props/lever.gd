extends StaticBody3D

signal leverEnterCheck
signal leverExitCheck


func _on_lever_body_entered(body):
	leverEnterCheck.emit()

func _on_lever_body_exited(body):
	leverExitCheck.emit()
	
