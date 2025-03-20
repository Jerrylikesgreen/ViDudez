extends Control
class_name Inventory

@export var pocket: Array[Item] = [
	
]



#--------------------[Add Item From Pocket]-------------------------------
func add_item(new_item: Item) -> void:
	for existing_item in pocket:
		if existing_item.item_name == new_item.item_name:
			var can_stack = existing_item.max_stack - existing_item.quantity
			var to_move = min(can_stack, new_item.quantity)
			existing_item.quantity += to_move
			new_item.quantity -= to_move

			if new_item.quantity > 0:
				var leftover = new_item.duplicate()
				pocket.append(leftover)
			return
	pocket.append(new_item)
	
	

#--------------------[Remove Item From Pocket]-------------------------------
func remove_item(item_name: String, quantity: int) -> int:
	for i in pocket:
		if i.item_name == item_name:
			var amount_removed = min(quantity, i.quantity)
			var total_value = i.hunger_value * amount_removed
			i.quantity -= amount_removed
			if i.quantity <= 0:
				pocket.erase(i)
			
			return total_value
	return 0
