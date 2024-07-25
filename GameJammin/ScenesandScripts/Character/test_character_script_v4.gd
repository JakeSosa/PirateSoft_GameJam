extends CharacterBody3D
#Player Controller reference video (https://www.youtube.com/watch?v=0T-FMkSru64)
#Camera Controller reference video (https://www.youtube.com/watch?v=yVde3I3K7oo)

#Player Controller Variables
const Speed = 5.0
var is_running = false
@onready var animation_player = $Char2/AnimationPlayer
@onready var character_model = $Char2

#Camera Controller Variables
@onready var camera_controller = $CameraController

#Torch Controller Variables (also used in brazier script)
@onready var torch = $Char2/Armature/Skeleton3D/BoneAttachment3D/MeshInstance3D/OmniLight3D
var near_brazier := false
var interactable = true

func _physics_process(_delta):
	player_controller()
	player_camera()
	douse_torch()
	
func player_controller():
	#Note, in our game map,movement is not the standard (-x. +x, -z, +z)
	var input_dir = Input.get_vector("moveUp", "moveDown" , "moveRight" ,"moveLeft")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * Speed
		velocity.z = direction.z * Speed 
		#Set character model to look in direction of player input
		if is_running == true:
			var angle = atan2(velocity.z, -velocity.x)
			var character_rotation = character_model.get_rotation()
			character_rotation.y = angle
			character_model.set_rotation(character_rotation)
		#If is_running does not equal false, then we set it to true & play Run animation
		if !is_running:
			is_running = true
			animation_player.play("Run")
	else:
		velocity.x = move_toward(velocity.x, 0, Speed)
		velocity.z = move_toward(velocity.z, 0, Speed) 
		#If is_running does equal false, then we set it to false & play Idle animation
		if is_running:
			is_running = false
			animation_player.play("Idle")
	move_and_slide()
	
func player_camera():
	#Make camera controller position match the player's position via lerp
	camera_controller.position = lerp(camera_controller.position, position, 0.10)
	
func douse_torch():
	if interactable == true:
		#After player interacts with torch, then set interactable to false
		interactable = false
		#If player presses Q, douse torch aka reset color to white
		if Input.is_action_just_pressed("douseTorch"):
			torch.light_color = Color.WHITE
			animation_player.play("Douse")
			#Set timer to 2 seconds to match time of our Douse animation
			await get_tree().create_timer(2.0,false).timeout
		#After the above code has run, set interactable back to true
		interactable = true




