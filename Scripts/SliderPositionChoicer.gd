extends VSlider

@onready var grabber_sprite = $Grabber
@export var timer_label = Label

func _ready():
	$DottedLine/Area2D.timer_label = timer_label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var current_grabber_position_y = -(value * size.y) / max_value
	var sprite_position = Vector2(size.x / 2, current_grabber_position_y + size.y)
	grabber_sprite.position = sprite_position
