extends Button

@onready var ball = preload("res://Scenes/Ball.tscn")
@export var pin_joint : PinJoint2D


func _on_pressed():
	visible = false
	
	var ball_instance = ball.instantiate()
	ball_instance.global_position = Vector2(0,0) #get_node("../../SpawnPointGhost").global_position
	ball_instance.visible = true
	add_child(ball_instance)
	
