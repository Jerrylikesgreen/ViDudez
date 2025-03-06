extends Timer
class_name Game_Clock



signal _Clock_Ticked


func _ready() -> void:
	pass # Replace with function body.


func _process(delta: float) -> void:
	pass

func _on_timeout() -> void:
	_Clock_Ticked
