extends StaticBody3D

@export var red_brazier : OmniLight3D
@export var blue_brazier : OmniLight3D
@export var green_brazier : OmniLight3D
@export var cyan_brazier : OmniLight3D
@export var yellow_brazier : OmniLight3D
@export var purple_brazier : OmniLight3D



var brazier_color_array = [Color.RED, Color.BLUE, Color.GREEN, Color.CYAN, Color.YELLOW, Color.PURPLE]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
