extends World_
class_name Spawner

var apple_scene = preload("res://Scripts/Items/apple.tscn")

@onready var spawn_flag = $SpawnFlag


func _ready() -> void:
	pass 


 
func _process(_delta: float) -> void:
	pass


func spawn_apple() -> void:
	var apple_instance = apple_scene.instantiate()
	add_child(apple_instance)
	#apple_instance.global_position = spawn_flag.global_position

func _on_food_pressed() -> void:
	spawn_apple()
	print("button pressed ")
