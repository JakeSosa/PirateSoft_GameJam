extends StaticBody3D

#Signal lever area enter & exit checks to player script
signal EnterCheck
signal ExitCheck

func _on_lever_body_entered(body):
	EnterCheck.emit()

func _on_lever_body_exited(body):
	ExitCheck.emit()
	
