class_name Jogador extends Resource


func _init(nickname:String,level:int = 1, inventory:Array = []):
	var jogador = {
		"nickname": nickname,
		"level": level,
		"inventory": inventory
	}
	create_jogador(nickname,jogador)

static func create_jogador(nickname:String,jogador:Dictionary) ->void:
	var responseValidation = verifica_nickname(nickname)
	if (responseValidation):
		print("jogador ja existe")
		return
	else:
		var file = FileAccess.open("user://database_players/"+nickname+".json",FileAccess.WRITE)
		file.store_string(JSON.stringify(jogador))
		print(jogador)

static func verifica_nickname(nickname:String):
	var archive_name = FileAccess.file_exists("user://database_players/"+nickname+".json")
	if(!archive_name):
		print("JOGADOR NAO EXISTE")
		return null
	else:
		var new_archive = FileAccess.open("user://database_players/"+nickname+".json",FileAccess.READ)
		var data = JSON.parse_string(new_archive.get_as_text())
		return data
	
