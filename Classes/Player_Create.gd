class_name Player extends Resource

var nickname: String = ""
var level: int = 1
var experience: int = 0
var inventory: Array = []

func level_upgrade() -> void:
	experience -= 100
	level += 1
	print(nickname, " subiu para o nivel")

func add_item(item: String) -> void:
	inventory.append(item)
	print(nickname, " recebeu: ", item)

#metodo pra converter um jogador para dicionario
func for_dicionary() -> Dictionary:
	return {
		"nickname": nickname,
		"level": level,
		"experience": experience,
		"inventory": inventory
	}

#criar um jogador diretamente para dicionario
static func from_dicionary(data: Dictionary) -> Player:
	var player = Player.new()
	player.nickname = data.get("nickname", "")
	player.level = data.get("level", 1)
	player.experience = data.get("level", 0)
	player.inventory = data.get("inventory", [])
	return player

func save_player(player: Player, path: String) ->void:
	var archive = FileAccess.open(path, FileAccess.WRITE)
	var data = player.for_dicionary()
	archive.store_line(JSON.stringify(data))
	
func load_player(path: String) -> Player:
	if not FileAccess.file_exists(path):
		return null
	
	var archive = FileAccess.open(path, FileAccess.READ)
	var data = JSON.parse_string(archive.get_as_text())
	return Player.from_dicionary(data)

static func seach_player(nickname: String) -> Player:
	var path = "user://database_players/%s.json" % nickname
	if not FileAccess.file_exists(path):
		print("Jogador %s não encontrado" % nickname)
		return null
	
	var archive = FileAccess.open(path, FileAccess.READ)
	var data = JSON.parse_string(archive.get_as_text())
	return Player.from_dicionary(data)
