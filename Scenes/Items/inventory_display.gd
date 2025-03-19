extends GridContainer
class_name InventoryDisplay

var _is_visible = false

var item_slot_scene = preload("res://Scenes/Items/item_slot.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func spawn_item_slot(item) -> void:
	var item_slot_instance = item_slot_scene.instantiate()
	item_slot_instance.item_resource = item
	item_slot_instance.set_material(item.icon)
	item_slot_instance.set_size(Vector2(50, 50))
