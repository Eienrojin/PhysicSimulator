extends Area2D

@export var timer_label : Label

func _on_body_entered(body):
	if body is MainBall:
		timer_label.should_work = false
