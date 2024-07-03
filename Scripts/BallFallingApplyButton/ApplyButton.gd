extends Button

@onready var ball = get_node("../../../Ball")
@onready var mass = get_node("../MassTextEdit")
@onready var gravity = get_node("../GravitationTextEdit")

func _on_pressed():
	ball.mass = float(mass.text)
	PhysicsServer2D.area_set_param(get_viewport().find_world_2d().space, PhysicsServer2D.AREA_PARAM_GRAVITY, float(gravity.text) * 100)
