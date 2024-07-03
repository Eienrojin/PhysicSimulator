extends Button


func _on_pressed():
	get_node("../..").visible = false
	get_node("../../../SimChoice").visible = true
