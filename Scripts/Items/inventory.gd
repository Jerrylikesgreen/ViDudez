extends Control
class_name Inventory 

# Dont need to know amount here. assasasa
@export var pocket: Array = [["Name", 1]]





# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



			   # String + Item later. 
func _set_item(Item) -> void:
	pocket.append(Item)


func _get_item(Item) -> Array:
	return pocket
	pocket.erase(Item)


	
