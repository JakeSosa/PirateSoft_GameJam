extends CharacterBody3D
#Player Controller reference video (https://www.youtube.com/watch?v=0T-FMkSru64)
#Camera Controller reference video (https://www.youtube.com/watch?v=yVde3I3K7oo)

#Player Controller Variables
const Speed = 5.0
var is_running = false
@onready var animation_player = $Char2/AnimationPlayer
@onready var character_model = $Char2
@onready var torch = $Char2/Armature/Skeleton3D/BoneAttachment3D/MeshInstance3D/OmniLight3D
#Camera Controller Variables
@onready var camera_controller = $CameraController

var isInArea : bool = false
var changingColor : Color
var torch_color
var under_waterfall : = false
func _ready():
	torch_color = $Char2/Armature/Skeleton3D/BoneAttachment3D/MeshInstance3D/OmniLight3D.light_color

func _physics_process(_delta):
	
	#Player Controller
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
	if isInArea == true && Input.is_action_just_pressed("lightTorch"):
		torch.visible = true
		$Char2/Armature/Skeleton3D/BoneAttachment3D/MeshInstance3D/OmniLight3D.light_color = changingColor


	move_and_slide()
	
	#Camera Contoller
	#Make camera controller position match the player's position via lerp
	camera_controller.position = lerp(camera_controller.position, position, 0.10)

func _on_brazier_color_pass(colorChange):
	changingColor = colorChange

func _on_brazier_area_enter_check():
	isInArea = true

func _on_brazier_area_exit_check():
	isInArea = false
