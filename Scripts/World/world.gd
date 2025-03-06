extends Node
class_name World_

@onready var GAME_STATE = "Main_Loop"
@onready var CLOCK: float = 0.0
@onready var _is_running: bool = false




func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
	pass


func _on_timer_clock_ticked() -> void:
	pass # Replace with function body.


func _clock_tick_count() -> void:
	CLOCK += 0.1
	_is_running = true

func _check_is_running() -> bool:
	return _is_running 
