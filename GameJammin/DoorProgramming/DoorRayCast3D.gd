extends StaticBody3D
#Reference video (https://www.youtube.com/watch?v=hNM6ETntl8g)

#Set variable to tell us whether the door is open or closed
var is_open = false
#Set variable to determine when the player can or cannot interact with the door
#For example, when door animation is playing we do NOT want player to ineteract with the door
var interactable = true

@export var animation_player: AnimationPlayer

func interact():
	if interactable == true:
		#After the player interacts with the door (true) then interactable will be set to false
		interactable = false
		#And whatever is_open is equal to before will now change to be the opposite
		is_open = !is_open
		#If the door is open, then the DoorOpen animation will play
		if is_open == true:
			animation_player.play("DoorOpen")
		#If the door is closed, then the DoorClose animation will play
		if is_open == false:
			animation_player.play("DoorClose")
		#Set timer to 2 seconds which matches the time of our door animation
		await get_tree().create_timer(2.0, false).timeout
		#After the above code has run, then interactable will be set to true again
		interactable = true
		
		
			
		
		
		
		


