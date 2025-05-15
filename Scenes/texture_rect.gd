extends TextureRect

@onready var subviewport:PackedScene = preload("res://Card3D.tscn")
#@onready var subviewport: SubViewport = $SubViewport
func _ready() -> void:
	var logo = subviewport.instantiate()
	add_child(logo)
	
	
	texture = logo.get_texture()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
