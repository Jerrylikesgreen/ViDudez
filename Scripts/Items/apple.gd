extends Sprite2D
class_name AppleSprite

@export var apple_resource: Resource 

@onready var options: MenuBar = $Options


signal grabbed(apple_resource: Item, int)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var emitter = $AppleArea
	emitter.connect("input_event", Callable(self, "_on_area_2d_input_event"))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			options.set_visible(true)
			print("Area2D was left-clicked!")


func _on_grab_pressed() -> void:
	options.set_visible(false)
	emit_signal("grabbed", apple_resource, 1)
	queue_free()
	pass # Replace with function body.
