extends World_
class_name Game_Loop_Manager
## Game_Loop_Manager is meant to manage the Game Loop. 



func _ready() -> void:
	
	pass # Replace with function body.



func _process(_delta: float) -> void:
	if not _is_running:  
		GAME_STATE == "GAME OVER"
