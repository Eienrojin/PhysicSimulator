extends Label

@onready var pass_area = get_node("../../../PassArea2D")

func _process(delta):
	text = "История пересечений:\n"
	for index in range(pass_area.ball_pass_time_history.size()):
		if pass_area.ball_pass_time_history[index] != null:
			text += str(index + 1) + ". " + str(pass_area.ball_pass_time_history[index]) + " сек.\n"
		else:
			text += str(index + 1) + ". " + "?" + " сек.\n"
		if index >= 10:
			break
