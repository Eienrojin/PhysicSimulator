extends Button

func _on_pressed():
	get_tree().paused = not get_tree().paused
