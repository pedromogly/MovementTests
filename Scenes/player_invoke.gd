extends Control

@onready var createButton:Button = $ColorRect/Button
@onready var inputText:LineEdit = $ColorRect/VBoxContainer/LineEdit

@onready var searchButton:Button = $ColorRect/Button2
@onready var inputSearch: LineEdit = $ColorRect/VBoxContainer2/LineEdit

func _ready() ->void:
	pass

func _on_button_button_up() -> void:
	if(inputText.text == ""):
		return
	
	var newPlayer = Player.new()
	newPlayer.nickname = inputText.text
	newPlayer.save_player(newPlayer, "user://database_players/"+newPlayer.nickname+".json")


func _on_button_2_button_up() -> void:
	var nickname = inputSearch.text
	var searchPlayer = Player.seach_player(nickname)
	if (searchPlayer):
		print("Nickname: ",searchPlayer.nickname)
		print("Level: ",searchPlayer.level)
		print("Experience: ",searchPlayer.experience)
		print("Items: ",searchPlayer.inventory)


func _on_button_button_up_3() -> void:
	var nickname = inputSearch.text
