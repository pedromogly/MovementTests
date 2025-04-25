extends Node

var vivo: bool = true
const vida:int = 120
var velocidade: float = 2.5
var danoTomado = 20

func _ready():
	print("Ola mundo")
	print("Batalha")
	tomarDano(vida, danoTomado)
		
	var contagem = 0
	while contagem < 5:
		print("Em batalha")
		tomarDano(vida,danoTomado)
		contagem += 1

var dinamica = 42
const pi = 3.14



func tomarDano(vidaTotal:int, danoTomado:int):
	var vidaRestante = vidaTotal - danoTomado
	
	if vidaRestante <= 0:
		vivo = false
		
	if (!vida):
		print("Player Está morto")
	else:
		print("Player ainda está vivo, VIDA: ", vidaRestante, ", BOA")
