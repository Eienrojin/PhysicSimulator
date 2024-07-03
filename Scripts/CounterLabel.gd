extends Label

var time_elapsed := 0.0
var should_work := true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if should_work:
		time_elapsed += delta 
		text = "Время пересечения: " + str(snapped(time_elapsed, 0.01))
