extends World_
class_name ViDudez_Brain

##                                             >                     Resource which contains an array called Vi States
@onready var ViDudez_States: Resource = preload("res://Data/Resources/ViStates.tres")
@onready var ViDudez_Stats: Resource = preload("res://Data/Resources/ViStats.tres")
@onready var _is_hungry: bool = false
@onready var base_stats = null
@onready var combat_stats = null
@onready var needs = null
@onready var time_passed = 0.0

##                                              >                       Holds current state - none currenrtly defined. 
@export var active_state = "Idle"


##                                              >                       Tracks/Declares Evolution stage. =
# Flag Export Bit Bool [ String, Int ] 
@export_flags("1st Stage", "2nd Stage", "3rd Stage")  var  evolution_stage = 1

func _ready() -> void:
	combat_stats = ViDudez_Stats.get("combat_stats")
	needs = ViDudez_Stats.get("needs")
	base_stats = ViDudez_Stats.get("base_stats")
	print(needs)
	

func _process(_delta: float) -> void:
	
	if needs.Hunger <= 50:
		_is_hungry = true
		print("_is_hunger got triggered.")
		print(_is_hungry)
	
	pass


#---------- Hunger Logic 
func getting_hungry() -> void: 
	if time_passed > 10: 
		needs.Hunger -= 1
		time_passed = 0
		print("Got Hungrier")

# ------ Set and Getter for States. 
##                     ->->                       >                     Currently checks the active_state and returns it. 
func _get_state() -> String:
	var current_state = active_state
	if current_state == null:
		print("Error NULL")
	return current_state
	
##                     ->->                       >                      Excpects to receive a String defining a state,
##                                                                       then saves the prior state and finnally sets 
##                                                                       active_state with setting_state
func _set_state(vi_states:String) -> String:
	var setting_state = vi_states #Currently only saves the state locally. Will use this later. 
	if setting_state == active_state:
		print("State already set.")
	
	return setting_state
	active_state = setting_state



#----------
# Function to increase EXP > Takes in / passes a float
func exp_gain(Exp)-> void:
	var current_exp = base_stats.Exp 
	if current_exp >= 100:
		print("Cannot Gain more EXP")
		pass
	else:
		base_stats.Exp + Exp
	
# Function that will triger when EXP is MAXED??? - EXP is float. 

func evolve() -> void:
	var current_exp = base_stats.Exp 
	if current_exp >= 100:
		evolution_stage += 1
	else:
		print("Error, Not enough EXP to evolve.")

func age() -> void:
	if time_passed >= 50:
		base_stats.Age += 1

# Gain Happiness function 
func gain_happiness(Happiness:float) -> float: 
	if base_stats.Happiness == 1:
		print("Maxed Happyness - Triggering Evolution.")
		evolve()
		return base_stats.Happiness 
	else:
		base_stats.Happiness += Happiness
		return base_stats.Happiness 
# Lose Happiness function. 


#func eat() -> void:
	#Grta

#------Incoming Signals. 
func _on_world__time_passed() -> void:
	time_passed += 0.1
	getting_hungry()
	age()
