extends Area3D

#Set variable to determine if player is near red light or not
var near_red_light := false

func _on_RedKey_body_entered(body: Node3D) -> void:
	#When player enters Area3D of red light, we want player to press an action
	#Which will enable player to pick up the light color 
	#When player body enters door's Area3D, then set near_door to true
	near_red_light = true
	print("NearRedLightTrue")

