extends Control
class_name Inventory 


@export var pocket: Array = [Item]


func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	pass

#------------------[ Adding Item into Pocket ]----------------------------------------------------
func _set_item(item: Item, quantity: int) -> void:
	for i in range(quantity):
		pocket.append(item)
#------------------[ Taking Item out of Pocket ]----------------------------------------------------
func _get_item(item_name: String, quantity: int) -> void:
	for i in pocket:
		match i[0]:
			item_name:
				i[i] -=1
				print(item_name, " -1 ", i[1], " left" )
				if i[1] <= 0:
					pocket.erase(1)
					print()
				return
			
			
	# logic to parse through Array if item is in list remove 1 from quantity if => 1 remove item from list.
	pocket.erase(item_name)


	
