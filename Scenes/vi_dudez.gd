extends CharacterBody2D
class_name ViDudez_Body



## ViDudez Stats - Resource of Differant Dictionaries. Each Dic is a type of stats, exp Combat Stats, 
##                 Inventory, Mood, ect. - 
##                                            >            Resource which contains 2 dictionaries Combats Stats + Needs                                                      
@export var ViDudez_Stats: Resource 






##                                             >                 Setter function to set stats 
func _set_stat(dict_name : String, target_key : String, target_value) -> void:
	if not ViDudez_Stats:
		print("Error")
		return
	match dict_name:
		"combat_stats":
			_set_dict_stat(ViDudez_Stats.combat_stats, target_key, target_value)
		"needs":
			_set_dict_stat(ViDudez_Stats.needs, target_key, target_value)


##                                            >                  Helper Function. Sets Dict
func _set_dict_stat(dict_ref: Dictionary, key: String, value) -> void:
	if dict_ref.has(key):
		dict_ref[key] = value
	else:
		print("Key '%s' not found in dictionary. Adding it." % key)
		dict_ref[key] = value



# Getter function to get stats 
