extends World_
class_name ViDudez_State_Machine

##                                             >                     Resource which contains an array called Vi States
@onready var ViDudez_States: Resource 

##                                              >                       Holds current state - none currenrtly defined. 
@export var active_state = "Idle"



func _ready() -> void:
	pass 


func _process(_delta: float) -> void:
	pass


##                                               >                     Currently checks the active_state and returns it. 
func _get_state() -> String:
	var current_state = active_state
	if current_state == null:
		print("Error NULL")
	return current_state
	
##                                               >                       Excpects to receive a String defining a state,
##                                                                       then saves the prior state and finnally sets 
##                                                                       active_state with setting_state
func _set_state(vi_states:String) -> String:
	var setting_state = vi_states #Currently only saves the state locally. Will use this later. 
	if setting_state == active_state:
		print("State already set.")
	return setting_state
	active_state = setting_state
