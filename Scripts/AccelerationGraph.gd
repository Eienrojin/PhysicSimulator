extends Control

@onready var plot = $Graph2D
@export var ligma_ball = RigidBody2D
var draw_enabled := true
var old_velocity : float = 0.0
var time_elapsed := 1.0
var x = 0.0

func _ready():
	plot = $Graph2D.add_plot_item("Ускорение", Color.RED, 0.5)

func _process(delta):
	if draw_enabled:
		var new_velocity = ligma_ball.linear_velocity.y
		var acceleration = (new_velocity - old_velocity) / time_elapsed
		old_velocity = new_velocity
		
		plot.add_point(Vector2(x, acceleration))
		x += 0.1
	
	if draw_enabled and x > $Graph2D.x_max:
		plot.clear()
		x = 0.0

func _on_draw_button_pressed() -> void:
	draw_enabled = true
	plot.clear()
	x = 0.0


func _on_clear_button_pressed() -> void:
	draw_enabled = false
	plot.clear()
	x = 0.0
