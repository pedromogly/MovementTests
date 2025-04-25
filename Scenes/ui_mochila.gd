extends Control

@export var vida_maxima:int = 100
@export var vida_atual:int = 70

@onready var label_vida:Label = $Panel/VBoxContainer/Panel/vida
@onready var label_feedback:Label = $Panel/feedback
func _ready():
	att_ui()
	
func att_ui():
	label_vida.text = "Vida: %s/%s" % [vida_atual,vida_maxima]
	if(vida_atual <= 0):
		label_feedback.text = "VOCÊ MORREU"

func _on_botao_potion_pressed():
	vida_atual = min(vida_atual + 40, vida_maxima)
	label_feedback.text = "Poção Usada!"
	att_ui()
	
func _mutilar():
	vida_atual = max(vida_atual - 20, 0)
	label_feedback.text = "Se bateu! WTH"
	att_ui()
	
