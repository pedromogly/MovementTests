extends Node

var health:int = 120

@onready var label:Label = $ColorRect/Label

func _ready() -> void:
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass

func take_damage(amount):
	health -= amount
	if health < 0:
		die()
func die() ->void:
	print("MORRI")
	
func run():
	@warning_ignore("shadowed_variable")
	for health in range(3):
		print("Vagabundeco")
	return
