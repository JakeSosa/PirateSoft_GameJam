extends CharacterBody3D
#Player Controller reference video (https://www.youtube.com/watch?v=0T-FMkSru64)
#Camera Controller reference video (https://www.youtube.com/watch?v=yVde3I3K7oo)

#Player Controller Variables
const Speed = 5.0
var is_running = false
var is_lighting = false
var is_dousing = false
@onready var animation_player = $Char2/AnimationPlayer
@onready var character_model = $Char2
@onready var torch = $Char2/Armature/Skeleton3D/BoneAttachment3D/MeshInstance3D/OmniLight3D

#Camera Controller Variables
@onready var camera_controller = $CameraController

#Lever Animation Variables
@export var lever_animation_player : AnimationPlayer
@export var lever_audio_player: AudioStreamPlayer3D

#Torch Controller Variables
var near_brazier : bool = false
var near_lever : bool = false
var near_sconce : bool = false
var change_torch_color : Color
var torch_color
#Waterfall variables
var under_waterfall : = false
signal kill_waterfall
#Sconce Variables
signal change_sconce_color

func _ready():
	torch_color = $Char2/Armature/Skeleton3D/BoneAttachment3D/MeshInstance3D/OmniLight3D.light_color

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
	#If player is in area of brazier and presses E play Light animation
	if near_brazier == true && Input.is_action_just_pressed("interact"):
		is_lighting = true
		torch.visible = true
		$Char2/Armature/Skeleton3D/BoneAttachment3D/MeshInstance3D/OmniLight3D.light_color = change_torch_color
		animation_player.play("Light")
		$AnimationTimer.start()
	
	#Paramters for interacting with sconce
	if near_sconce == true && Input.is_action_just_pressed("interact"):
		is_lighting = true
		torch.visible = true
		$Char2/Armature/Skeleton3D/BoneAttachment3D/MeshInstance3D/OmniLight3D.light_color = change_torch_color
		animation_player.play("Light")
		$AnimationTimer.start()
	
	#If player presses Q play Douse animation	
	if Input.is_action_just_pressed("douseTorch"):
		is_dousing = true
		$Char2/Armature/Skeleton3D/BoneAttachment3D/MeshInstance3D/OmniLight3D.light_color = Color.WHITE
		animation_player.play("Douse")
		$AnimationTimer.start()
	if Input.is_action_just_pressed("pull"):
		pass
#Emitted signals from brazier scene to pass color change value if player in brazier area
func _on_brazier_color_pass(colorChange):
	change_torch_color = colorChange
func _on_brazier_area_enter_check():
	near_brazier = true
func _on_brazier_area_exit_check():
	near_brazier = false
	
#Emitted signals from sconce scene if player is near sconce
func _on_sconce_sconce_color_pass(sconce_colorChange) -> void:
	change_torch_color = sconce_colorChange
	print("sconce color pass")	
func _on_sconce_sconce_enter_check() -> void:
	near_sconce = true
func _on_sconce_scone_exit_check() -> void:
	near_sconce = false	
	
#Emiited signals from lever scene if player is near lever
func _on_lever_lever_enter_check():
	near_lever = true
func _on_lever_lever_exit_check():
	near_lever = false
func _input(event):
	#If player is near lever and press E, play Pull animation
	if Input.is_action_just_pressed("interact") and near_lever == true:
		lever_animation_player.play("Pull")
		lever_audio_player.play()
		kill_waterfall.emit()	
		
#Set Animation timer on player scene to make sure animation finishes before player moves
func _on_animation_timer_timeout() -> void:
	is_dousing = false
	is_lighting = false


		



