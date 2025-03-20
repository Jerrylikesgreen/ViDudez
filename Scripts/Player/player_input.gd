extends Window
class_name PlayerInput

@onready var inventory = $"../Inventory"
@onready var inventory_display = $InventoryDisplay
@onready var player_buttons = $CenterContainer/PlayerButtons
@onready var pocket = inventory.pocket


func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_food_pressed() -> void:
	
	
	pass # Replace with function body.


func _on_sleep_pressed() -> void:
	pass # Replace with function body.


func _on_clean_pressed() -> void:
	pass # Replace with function body.


func _on_inventory_pressed() -> void:
	player_buttons.set_visible(false)
	pass

func display_inventory() -> void:
	inventory_display.spawn_item_slot
	


func _on_eat_pressed() -> void:
	pass # Replace with function body.
