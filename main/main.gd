extends Node2D

## Setup our game.
func _ready() -> void:
	print("NARF main")
	set_window_min_size()

## Grab the initial size and set the minimum to match it.
func set_window_min_size() -> void:
	var min_size = Vector2i.ZERO
	min_size.x = ProjectSettings.get_setting('display/window/size/viewport_width')
	min_size.y = ProjectSettings.get_setting('display/window/size/viewport_height')
	get_window().min_size = min_size
