extends CharacterBody2D

const angle_offset = PI / 2.0  # Сдвиг для начала движения сверху (90 градусов)

@export var radius = 100.0
@export var speed = 1.0
@export var angle = 0
@export var status_label : Label
@onready var earth = get_parent().get_node("Earth")
var user_input = 7.90
var this_scope_delta
var must_stop = false
var must_stop_rotate = false

enum states {BELOW_FIRST_COSMIC_SPEED, EQUALS_FIRST_COSMIC_SPEED, ABOVE_FIRST_COSMIC_SPEED}

func _physics_process(delta):
	this_scope_delta = delta
	define_moving_algorithm_and_move()


func _on_area_2d_body_entered(body):
	must_stop = true


func _on_earth_gravity_area_2d_body_exited(body):
	must_stop_rotate = true


func define_moving_algorithm_and_move():
	const too_slow_border = 7.89
	const too_fast_border = 7.94
	
	if user_input < too_slow_border:
		move_too_slow()
	elif user_input > too_fast_border:
		move_too_fast()
	else:
		move_around_planet()


func move_too_slow():
	var fall_speed = 0
	
	if must_stop:
		speed = move_toward(speed, 0.0, this_scope_delta)
		fall_speed = 0
		status_label.text = "Объект врезался в планету"
	else:
		fall_speed = 0.1
		move_around_planet()
		status_label.text = "Объект скоро врежется в планету"
		radius -= fall_speed


func move_too_fast():
	const fly_away_speed = 0.1
	if not must_stop_rotate:
		move_around_planet()
		status_label.text = "Объект скоро слетит с орбиты"
	else:
		status_label.text = "Объект слетел с орбиты"
		velocity = (Vector2(speed, speed).rotated(rotation) * this_scope_delta)
	radius += fly_away_speed


func move_around_planet():
	angle += speed * this_scope_delta
	var x = radius * cos(angle - angle_offset)
	var y = radius * sin(angle - angle_offset)
	position = Vector2(x + earth.position.x, y + earth.position.y)
	look_at(get_parent().get_node("Marker2D").position)
	status_label.text = "Объект на орбите"
