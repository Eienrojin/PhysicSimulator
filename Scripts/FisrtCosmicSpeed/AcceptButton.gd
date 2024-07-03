extends Button

@export var ball : CharacterBody2D
@export var speed_textbox : LineEdit


func _on_pressed():
	ball.user_input = float(speed_textbox.text)
	get_tree().paused = false
