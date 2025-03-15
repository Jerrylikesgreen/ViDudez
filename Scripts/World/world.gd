extends Node
class_name World_

signal _time_passed

var game_state: String = "Main_Loop"
var clock: float = 0.0
var _is_running: bool = false

func _ready() -> void:
	_is_running = true

func _process(delta: float) -> void:
	if _is_running:
		clock += delta
		if clock >= 1.0:
			emit_signal("_time_passed")
			clock = 0.0
