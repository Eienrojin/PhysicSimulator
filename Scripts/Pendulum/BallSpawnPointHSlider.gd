extends HSlider

@onready var grabber_sprite = $Grabber
@onready var ball = preload("res://Scenes/Ball.tscn")
@onready var trail_effect = preload("res://Scenes/Tech/TrailEffect.tscn")
var sprite_position

func _process(delta):
	#usable_width * ((value - hslider.min_value) / (hslider.max_value - hslider.min_value))
	#var current_grabber_position_x = (value * size.x) / (max_value - min_value) - (size.x)
	var current_grabber_position_x = (size.x / 100) * value
	sprite_position = Vector2(current_grabber_position_x, size.y / 2)
	grabber_sprite.position = sprite_position

func _on_ball_spawn_button_pressed():
	get_node("Grabber").visible = false
	get_node("../UI/BallSpawnButton").visible = false
	get_parent().get_node("StartHSlider").visible = false
	
	var pendulum_joint = PinJoint2D.new()
	
	var ball_instance = ball.instantiate()
	var trail_instance = trail_effect.instantiate()
	trail_instance.max_length = 20
	ball_instance.add_child(trail_instance)
	ball_instance.global_position = Vector2(sprite_position.x, size.y / 2)
	
	get_node("..").add_child(ball_instance)
	
	pendulum_joint.node_a = ball_instance
	pendulum_joint.node_b = get_node("../StaticObject")
	#ball_instance.add_child()
