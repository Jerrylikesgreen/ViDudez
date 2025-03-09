extends Item
class_name Food 



@export var _is_rotten: bool = false
@export var _is_eatten: bool = false

# Defining food traits and logic. 




func eat(hunger_value) -> float:  # Hunger Value 
	if _is_eatten == true:
		return hunger_value
		print("Cant eat bbloooootch ")
	else:
		_is_eatten = true
		return hunger_value

func make_rotten() -> void:
	if _is_rotten == false:
		print("Errorororoeowrer")
		
	else:
		_is_rotten = true 
