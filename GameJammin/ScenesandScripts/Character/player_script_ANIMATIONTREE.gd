extends CharacterBody3D

#Player Controller Variables
const SPEED = 5.0

#Player Camera Variables
@onready var camera_controller = $CameraController


func _physics_process(delta: float) -> void:
	player_controller()
	player_camera()
	
func player_controller():
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("moveLeft", "moveRight", "moveUp", "moveDown")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	move_and_slide()
	
func player_camera():
	#NOTE: Reference video (https://www.youtube.com/watch?v=yVde3I3K7oo)
	
	#Make CameraController node position match player's position
	camera_controller.position = lerp(camera_controller.position, position, 0.10)
	
	
