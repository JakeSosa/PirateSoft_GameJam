extends CharacterBody3D

#Player Controller Variables
@onready var armature = $Char2/Armature
const LERP_VALUE = 0.15
const SPEED = 4.75
var moving = false
var interacting = false

#Player Camera Variables
@onready var camera_controller = $CameraController

#Torch Variables
@onready var torch = $Char2/Armature/Skeleton3D/BoneAttachment3D/playertorch/OmniLight3D
var default_torch_color = Color.WHITE

#Animation Parameter Variables
@onready var animation_tree = $Char2/AnimationTree
@onready var animation_timer = $AnimationTimer

func _ready() -> void:
	animation_tree.active = true
	
func _unhandled_key_input(event: InputEvent) -> void:
	#Quit Game
	if Input.is_action_just_pressed("quit"):
		get_tree().quit()
		
func _physics_process(delta: float) -> void:
	torch_controller()
	player_controller()
	player_camera()
	
func player_controller():
	#NOTE: Player Movement reference video (https://www.youtube.com/watch?v=VasHZZyPpYU)
	#NOTE: Animation Tree reference video (https://www.youtube.com/watch?v=WrMORzl3g1U) & (https://www.youtube.com/watch?v=KAZX4qfD06E)
	
	#Get the input direction and handle the movement/deceleration.
	var input_dir := Input.get_vector("moveLeft", "moveRight", "moveUp", "moveDown")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	
	#If player is not interacting (aka dousing, lighting, or pulling lever)
	if interacting == false:
		#And if direction does NOT equal zero
		if direction:
			velocity.x = direction.x * SPEED
			velocity.z = direction.z * SPEED
			#Then set moving equal to true
			moving = true
			#And rotate armature/player to face the direction of movement
			armature.rotation.y = lerp_angle(armature.rotation.y, atan2(-velocity.z, velocity.x), LERP_VALUE)
			#Set following animation parameters for animation tree
			animation_tree["parameters/conditions/is_running"] = true
			animation_tree["parameters/conditions/idle"] = false
		#Else if direction is zero
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			velocity.z = move_toward(velocity.z, 0, SPEED)
			#Then set moving equal to false
			moving = false
			#Set following animation parameters for animation tree
			animation_tree["parameters/conditions/is_running"] = false
			animation_tree["parameters/conditions/idle"] = true

		move_and_slide()
		
func player_camera():
	#NOTE: Player Camera reference video (https://www.youtube.com/watch?v=yVde3I3K7oo)
	
	#Make CameraController node position match player's position
	camera_controller.position = lerp(camera_controller.position, position, 0.10)
	
func torch_controller():
	#If player presses Q
	if Input.is_action_just_pressed("douseTorch"):
		#Set interacting to true
		interacting = true
		#And reset player torch color to white
		torch.light_color = default_torch_color
		#Set following animation parameters for animation tree
		animation_tree["parameters/conditions/is_dousing"] = true
	else:
		#Set following animation parameters for animation tree
		animation_tree["parameters/conditions/is_dousing"] = false
	
func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	print("Finished")
	interacting = false
