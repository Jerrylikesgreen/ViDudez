extends Resource
class_name ViStats
## ViStats 

## base_stats 
@export var base_stats: Dictionary = {
	"Exp" : 0.0,  # Float.
	"Age" : 0 # Int
}	

## combat_stats HP + Atk 
@export var combat_stats: Dictionary = {
		"HP" : 001,
		"Atk" : 001
}
 ## needs / Energy, Happiness, Hunger
@export var needs: Dictionary = {
		"Hunger" : 100,
		"Happiness" : 0.0, # Range of 0 to 1. Float. 
		"Energy" : 100
}
 
