extends Node2D

## The mapping context that we use (GUIDE).
@export var mapping_context:GUIDEMappingContext

## Setup our game.
func _ready() -> void:
	set_window_min_size()
	GUIDE.enable_mapping_context(mapping_context)	


## Grab the initial size and set the minimum to match it.
func set_window_min_size() -> void:
	var min_size = Vector2i.ZERO
	min_size.x = ProjectSettings.get_setting('display/window/size/viewport_width')
	min_size.y = ProjectSettings.get_setting('display/window/size/viewport_height')
	get_window().min_size = min_size
