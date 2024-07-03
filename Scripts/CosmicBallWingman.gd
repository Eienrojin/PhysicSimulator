extends Marker2D

const angle_offset = PI / 2.0  # Сдвиг для начала движения сверху (90 градусов)

@onready var earth = get_parent().get_node("Earth")
@onready var ball = get_parent().get_node("Ball")
@onready var angle = ball.angle + 1
@onready var radius = ball.radius + 50
var this_scope_delta

func _physics_process(delta):
	this_scope_delta = delta
	define_moving_algorithm_and_move()


func _on_area_2d_body_entered(body):
	ball.must_stop = true


func _on_earth_gravity_area_2d_body_exited(body):
	ball.must_stop_rotate = true


func define_moving_algorithm_and_move():
	const too_slow_border = 7.89
	const too_fast_border = 7.94
	
	if ball.user_input < too_slow_border:
		move_too_slow()
	elif ball.user_input > too_fast_border:
		move_too_fast()
	else:
		move_around_planet()


func move_too_slow():
	var fall_speed = 0.1
	move_around_planet()
	radius -= fall_speed
	
	if ball.must_stop:
		ball.speed = move_toward(ball.speed, 0.0, this_scope_delta)
		fall_speed = 0


func move_too_fast():
	const fly_away_speed = 0.1
	if not ball.must_stop_rotate:
		move_around_planet()
	radius += fly_away_speed


func move_around_planet():
	angle += ball.speed * this_scope_delta
	var x = radius * cos(angle - angle_offset)
	var y = radius * sin(angle - angle_offset)
	position = Vector2(x + earth.position.x, y + earth.position.y)
	look_at(get_parent().get_node("Marker2D").position)

