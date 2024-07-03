extends VBoxContainer

@export var simulation_scene : PackedScene


func _on_texture_rect_pressed():
	get_tree().change_scene_to_packed(simulation_scene)
