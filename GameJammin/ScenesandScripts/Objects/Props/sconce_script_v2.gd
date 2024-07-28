extends StaticBody3D

#Set public variable that will act as a pointer to the player in level 1 scene
@export var player : CharacterBody3D
#Sconce variables
@onready var sconce = $OmniLight3D
var default_sconce_color = Color.WHITE
var near_sconce := false

func _ready():
	sconce.light_color = default_sconce_color
	sconce.visible = false
	
func _physics_process(delta: float) -> void:
	deposit_sconce()
	withdraw_sconce()
	
func _on_sconce_body_entered(body: Node3D) -> void:
	near_sconce = true
func _on_sconce_body_exited(body: Node3D) -> void:
	near_sconce = false
	
func deposit_sconce():
	if near_sconce == true && sconce.visible == false:
		if player.torch.light_color != player.default_torch_color:
			if Input.is_action_just_pressed("interact"):
				player.is_lighting = true
				sconce.visible = true
				sconce.light_color = player.torch.light_color
				player.animation_player.play("Light")
				player.animation_timer.start()
func withdraw_sconce():
	if near_sconce == true && sconce.visible == true:
		if player.torch.light_color == player.default_torch_color:
			if Input.is_action_just_pressed("interact"):
				player.is_lighting = true
				sconce.visible = false
				player.torch.visible = true
				player.torch.light_color = sconce.light_color
				player.animation_player.play("Light")
				player.animation_timer.start()
		

