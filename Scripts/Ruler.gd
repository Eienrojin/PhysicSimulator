extends StaticBody2D

var major_line_distance := 22
var minor_line_distance = major_line_distance / 5
@export var start_value : int
@export var metric_value : int
@export var text_position = TextPosition.Right
@export var text_theme = Theme.new()
@export var count_of_metrics : int

# Called when the node enters the scene tree for the first time.
func _ready():
	draw_metrics()

func draw_metrics():
	var current_major_distance = 0
	var current_major_line_num = 0
	
	for n in count_of_metrics:
		var new_major_line = create_line(current_major_distance)
		var new_label = create_label(current_major_distance)
		
		add_child(new_major_line)
		add_child(new_label)
		start_value += metric_value
		current_major_distance += major_line_distance
		

func create_line(distance_between: int):
	var inst_line = preload("res://Scenes/Line.tscn").instantiate()
	inst_line.position.y -= distance_between
	inst_line.add_to_group("Metrics")
	return inst_line  

func create_label(distance_between: int):
	var label = Label.new()
	label.text = str(start_value)
	label.position.y -= distance_between

	if text_position == TextPosition.Right:
		label.position += Vector2(32, -12)
	else:
		label.position += Vector2(-40, -12)
	label.theme = text_theme
	label.add_to_group("Metrics")
	return label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

enum TextPosition {Left, Right}
