extends Area2D

var counter = 0
var ball_pass_time = 0
var ball_pass_time_history := []

func _physics_process(delta):
	ball_pass_time += delta
	ball_pass_time_history.resize(10)

func _on_body_entered(body):
	counter += 1
	if counter != 1:
		ball_pass_time_history.push_front(round(ball_pass_time * 100) / 100)
	print("count: " + str(counter) + "\npass time: " + str(ball_pass_time))
	ball_pass_time = 0
