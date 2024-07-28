extends CharacterBody3D
#Player Controller reference video (https://www.youtube.com/watch?v=0T-FMkSru64)
#Camera Controller reference video (https://www.youtube.com/watch?v=yVde3I3K7oo)
#NOTE - Player's Collision is assigned to 2 (player)
#NOTE - Player's Mask is assigned to 1 (aka environment: doors & 3 (aka props: sconce & brazier) 

#Player Controller Variables
const Speed = 5.0
var is_running = false
var is_lighting = false
var is_dousing = false
#Animation Variables
@onready var animation_player = $Char2/AnimationPlayer
@onready var character_model = $Char2
@onready var animation_timer = $AnimationTimer
#Torch Variables
@onready var torch = $Char2/Armature/Skeleton3D/BoneAttachment3D/MeshInstance3D/OmniLight3D
var default_torch_color = Color.WHITE
#Camera Controller Variables
@onready var camera_controller = $CameraController
#Lever Variables
@export var lever_animation_player : AnimationPlayer
@export var lever_audio_player: AudioStreamPlayer3D
var near_lever : bool = false
#Waterfall variables
signal kill_waterfall

func _ready():
	torch.light_color = default_torch_color
	
func _physics_process(_delta):
	player_controller()
	player_camera()
	torch_controller()
	
func player_controller():
	if is_dousing == false && is_lighting == false:
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
	
func torch_controller():
	#If player presses Q, play Douse animation	
	if Input.is_action_just_pressed("douseTorch"):
		is_dousing = true
		torch.light_color = default_torch_color
		animation_player.play("Douse")
		animation_timer.start()
		
#Set Animation timer on player scene to make sure animation finishes before player moves
func _on_animation_timer_timeout() -> void:
	is_dousing = false
	is_lighting = false	
	
	
	
	
	
	
	
#Recieved emiited signals from lever scene if player is near lever
func _on_lever_enter_check() -> void:
	near_lever = true
func _on_lever_exit_check() -> void:
	near_lever = false
	
#Emit signals from player script to waterfall script
func _input(event):
	#If player is near lever & presses E, play Pull animation
	if Input.is_action_just_pressed("interact") && near_lever == true:
		lever_animation_player.play("Pull")
		lever_audio_player.play()
		#Emit signal from player script to waterfall script
		kill_waterfall.emit()	
			
		


