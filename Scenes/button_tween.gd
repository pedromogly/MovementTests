extends Button

var scaleMult = scale * 1.1
var scaleDefault = scale

func _ready() -> void:

	connect("mouse_entered",_on_mouse_entered)
	connect("mouse_exited",_on_mouse_exited)
	
func _on_mouse_entered() -> void:
	create_tween().tween_property(self, "scale", scaleMult,0.2)

func _on_mouse_exited() -> void:
	create_tween().tween_property(self, "scale", scaleDefault,0.2)
