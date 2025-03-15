extends World_
class_name ViDudez_Brain
#-----------------------------[ViDudez Brain]-----------------------------------------------------

##                                             >                     Resource which contains an array called Vi States
@onready var ViDudez_States: Resource = preload("res://Data/Resources/ViStates.tres")
@onready var ViDudez_Stats: Resource = preload("res://Data/Resources/ViStats.tres")
@onready var _is_hungry: bool = false
@onready var base_stats = null
@onready var combat_stats = null
@onready var needs = null
@onready var time_passed = 0.0
@onready var hunger_bar = $HungerBar

#-----------------------------[Export Variables]-----------------------------------------------------
##                                              >                       Holds current state - none currenrtly defined. 

@export var active_state = "Idle"
##                                              >                       Tracks/Declares Evolution stage. =
#                     [ String, Int ] 
@export_flags("1st Stage", "2nd Stage", "3rd Stage")  var  evolution_stage = 1


#-----------------------------[Signals Out]-----------------------------------------------------

signal _hunger_pain  # Sending [ String + Bool ]

signal _poop

#-----------------------------[Ready]-----------------------------------------------------

func _ready() -> void:
	combat_stats = ViDudez_Stats.get("combat_stats")
	needs = ViDudez_Stats.get("needs")
	base_stats = ViDudez_Stats.get("base_stats")
	print(needs)


#-----------------------------[ViDudez Process]-----------------------------------------------------

func _process(_delta: float) -> void:
	hunger_bar.value = needs.Hunger
	if needs.Hunger <= 50:
		_is_hungry = true
		print("_is_hunger got triggered.")
		print(_is_hungry)
	
	pass


#-----------------------------[ViDudez Hunger]-----------------------------------------------------

func getting_hungry() -> void: 
	if time_passed > 10: 
		needs.Hunger -= 5
		time_passed = 0
		print("Got Hungrier")

#-----------------------------[ViDudez State Setter + Getter]-----------------------------------------------------

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



#-----------------------------[ViDudez Exp Gain]-----------------------------------------------------

# Function to increase EXP > Takes in / passes a float
func exp_gain(Exp)-> void:
	var current_exp = base_stats.Exp 
	if current_exp >= 100:
		print("Cannot Gain more EXP")
		pass
	else:
		base_stats.Exp + Exp
	

#-----------------------------[ViDudez Evolve]-----------------------------------------------------

func evolve() -> void:
	var current_exp = base_stats.Exp 
	if current_exp >= 100:
		evolution_stage += 1
	else:
		print("Error, Not enough EXP to evolve.")

#-----------------------------[ViDudez Age]-----------------------------------------------------

func age() -> void:
	if time_passed >= 50:
		base_stats.Age += 1



#-----------------------------[ViDudez Happiness Logic]-----------------------------------------------------
func gain_happiness(Happiness:float) -> float: 
	if base_stats.Happiness == 1:
		print("Maxed Happyness - Triggering Evolution.")
		evolve()
		return base_stats.Happiness 
	else:
		base_stats.Happiness += Happiness
		return base_stats.Happiness 
# Lose Happiness function. 

func lose_happines(Happiness:float) -> void:
	if base_stats.Happiness <= 0:
		print("Error, unable to lose anymore happiness")
	if base_stats.Happiness >= 1:
		print("Error unable to increase happiness further")
	else:
		base_stats.Happiness += Happiness



#-----------------------------[ViDudez Eating logic]-----------------------------------------------------
func digesting(hunger_value)-> void:
	if _is_hungry == true:
		needs.Hunger += hunger_value
		if needs.Hunger >= 100:
			needs.Hunger = 100
			_is_hungry = false
			_poop
			print("Ate Food: %d" % hunger_value)
			print("Is Full")
		if needs.Hunger <= 50:
			_is_hungry = true
			print("Still Hungry")
			print("Ate Food: %d" % hunger_value)
	else:
		print("Not Hungry")
		pass


func hunger_pain():
	if _is_hungry == true:
		_hunger_pain
	else:
		print("Error - is not hungry, hunger pain was triggered")



#-----------------------------[ViDudez Signals In]-----------------------------------------------------

func _on_world__time_passed() -> void:
	time_passed += 0.1
	getting_hungry()
	age()


	
