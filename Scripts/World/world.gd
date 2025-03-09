extends Node
class_name World_

@onready var GAME_STATE = "Main_Loop"
@onready var CLOCK: float = 0.0
@warning_ignore("unused_private_class_variable")
@onready var _is_running: bool = false

signal _time_passed 


func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
	CLOCK += 0.1
	if CLOCK > 1:
		CLOCK = 0.0
		emit_signal("_time_passed")
	pass
	
func _time_passing() -> void: 
	@warning_ignore("standalone_expression")
	_time_passed
	pass# This is here to remove an anoying error. 
