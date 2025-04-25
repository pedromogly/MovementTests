extends Node

const vidaMaxima = 100
@export_range(0,vidaMaxima) var vidaAtual:int = vidaMaxima

var mochila:Array = ['Arco','potion vermelha','flecha','pedra']
@export_range(1,4) var slotSelecionado:int

func _ready() -> void:
	vidaAtual = 70
	print("Sua vida está menor que sua vida máxima")
	
	acessarItem(slotSelecionado)
	#removerItem(slotSelecionado)
	usarItem(slotSelecionado)
	
func acessarItem(slot: int):
	slot = slot - 1
	if (slot >= len(mochila)) || (slot < 0):
		print("Slot da mochila inacessivel")
	else:
		print("Selecionado Item: ",mochila[slot])

func removerItem(slot: int):
	slot = slot - 1
	if (slot >= len(mochila)) || (slot < 0):
		print("Slot da mochila Inacessivel para excluir")
	else:
		mochila.remove_at(slot)
		print("Items disponiveis Na mochila Atualmente: ")
		for itemAtual in mochila:
			print(itemAtual)
			
func usarItem(slot: int):
	slot -= 1
	if (slot >= len(mochila)) || (slot < 0):
		print("Slot não acessivel")
		return
		
	var itemSelecionado = mochila[slot]
	match itemSelecionado:
		'Arco':
			equiparArma()
		'potion vermelha':
			recuperarVida()
		_:
			print("Item ",mochila[slot]," não utilizavel")
	

func recuperarVida():
	vidaAtual += 40
	if(vidaAtual > vidaMaxima):
		vidaAtual = vidaMaxima
	print("Sua vida foi recuperada, vida atual: ",vidaAtual)
	
func equiparArma():
	if(mochila.has("Arco")):
		if(mochila.has('flecha')):
			print("Arco e Flecha Equipados!")
		else:
			print("Não há flechas para usar o Arco")
	else:
		print("Não tem Arco para equipar")
