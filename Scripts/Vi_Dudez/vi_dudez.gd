extends CharacterBody2D
class_name ViDudez_Body


@onready var inventory: Inventory = $Inventory
@onready var collision_box: CollisionShape2D = $CollisionShape2D
@onready var brain: ViDudez_Brain = $ViDudezBrain
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var Spawner: Spawner = $"../World/Spawner"
var _is_hungry_notification: bool = false

func _on_apple_instance_grabbed(item, int):
	inventory._set_item(item, int)
	print("Apple was grabbed!")


func _ready() -> void:
	pass # Replace with function body.


func _process(_delta: float) -> void:
	pass





func _on_vi_dudez_brain__hunger_pain() -> void:
	pass # Replace with function body.


func _on_vi_dudez_brain__poop() -> void:
	pass # Replace with function body.
