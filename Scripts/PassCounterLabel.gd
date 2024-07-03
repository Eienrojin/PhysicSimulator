extends Label

@onready var pass_area = get_node("../../../PassArea2D")


func _process(delta):
	text = "Счётчик: " + str(pass_area.counter)
