extends RayCast3D
#Reference video (https://www.youtube.com/watch?v=hNM6ETntl8g)

#Following script enables player/character to interact with doors

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if is_colliding():
		#If our raycast hits an object we'll set it to be equal to the collider that the raycast hits
		var hit_object = get_collider()
		#If the object hit has the method "interact", which our door script does
		if hit_object.has_method("interact") && Input.is_action_just_pressed("interact"):
			hit_object.interact()
			
