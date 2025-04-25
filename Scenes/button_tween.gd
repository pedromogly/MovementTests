extends Button

func _ready() -> void:
	pass
	
func _on_mouse_entered() -> void:
	$AnimationPlayer.play("hover")

func _on_mouse_exited() -> void:
	$AnimationPlayer.play("exited")
