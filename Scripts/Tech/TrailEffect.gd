extends Line2D

var queue : Array
@export var max_length : int

func _ready():
	global_position = Vector2(0,0)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var pos = get_parent().global_position
	add_point(pos)
	queue.push_front(pos)
	
	if queue.size() > max_length:
		queue.pop_back()
	
	clear_points()
	
	for point in queue:
		add_point(point)
