class_name Items extends Resource

enum ItemType {WEAPON, EQUIPAMENT, CONSUMIVEIS, MATERIALS}
var item:Dictionary

const DATABASE_PATH = "user://database_items/"
const CATEGORY_FILES = {
	ItemType.WEAPON: "weapons.json"
}

func _init(p_name:String,p_type:ItemType,p_description:String,p_preco:int) -> void:
	
	item = {
		"id": 0,
		"name": p_name,
		"type": p_type,
		"description": p_description,
		"preco": p_preco
	}
	
	save_item()

func save_item() -> void:
	#criar o diretorio se não existir (ele já existe)
	DirAccess.make_dir_recursive_absolute(DATABASE_PATH)
	
	var file_path = DATABASE_PATH + CATEGORY_FILES[item["type"]]
	var all_items = carregar_items_por_tipo(item["type"])
	
	all_items.append(item)
	var file = FileAccess.open(file_path,FileAccess.WRITE)
	file.store_string(JSON.stringify(all_items, "\t"))
	file.close()
	
static func carregar_items_por_tipo(item_type:ItemType) -> Array:
	var file_path = DATABASE_PATH + CATEGORY_FILES[item_type]
	
	if not FileAccess.file_exists(file_path):
		return []
	
	var file = FileAccess.open(file_path, FileAccess.READ)
	var content = file.get_as_text()
	file.close()
	
	var result = JSON.parse_string(content)
	return result if result else []
	
static func search_items_for_name(data:Array, target_name:String) ->Dictionary:
	for item in data:
		if item["name"] == target_name:
			return item
	return {}
