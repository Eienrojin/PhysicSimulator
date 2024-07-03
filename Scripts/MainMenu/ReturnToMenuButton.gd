extends Button


func _on_pressed():
	get_node("../../Menu").visible = true
	get_node("..").visible = false
