extends Sprite2D

var dragging = false
var offset_ = Vector2(0, 0)


func _process(delta):
	if dragging:
		global_position = get_global_mouse_position() - offset_
		global_position.y = 32


func _on_button_button_down():
	dragging = true
	offset_ = get_global_mouse_position() - global_position


func _on_button_button_up():
	dragging = false
