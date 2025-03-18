extends World_
class_name Spawner
#-----------------------------[ Spawner Node ]----------------------------------------
## Spawner Node


#-----------------------------[ OnReady Variables ]----------------------------------------


##-----------------------------[ spawn_flag ]----------------------------------------
##  2D Node that tracks position of spawn target.
@onready var spawn_flag = $SpawnFlag


#-----------------------------[ Variables ]----------------------------------------

##-----------------------------[ apple_scene ]----------------------------------------
var apple_scene = preload("res://Scripts/Items/apple.tscn")

var _moving_flag: bool = false
#-----------------------------[ On Ready ]----------------------------------------

func _ready() -> void:
	pass 


#-----------------------[ Input ]----------------------------------------


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		if Input.is_key_pressed(KEY_SPACE):
			var mouse_position = get_viewport().get_mouse_position()
			spawn_flag.position = mouse_position

#-----------------------[ Process ]----------------------------------------
 
func _process(_delta: float) -> void:
	pass



#------------------------------[ Spawn Logic ]---------------------------------------
func spawn_apple() -> void:
	var apple_instance = apple_scene.instantiate()
	var vidudez = get_parent().get_parent().get_node("ViDudez")
	vidudez.add_child(apple_instance)
	apple_instance.global_position = spawn_flag.global_position
	apple_instance.set_scale(Vector2(250,250))
	apple_instance.grabbed.connect(vidudez._on_apple_instance_grabbed)


#-----------------------------[ On Signal Logic ]----------------------------------------

func _on_food_pressed() -> void:
	spawn_apple()
	print("button pressed")
