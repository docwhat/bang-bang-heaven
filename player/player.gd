extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree

const sprite_size: Vector2 = Vector2(16, 16)

## The speed of the player.
@export var speed:float = 100

## The action that moves the player.
@export var move_action:GUIDEAction

var last_direction: Vector2 = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	velocity = move_action.value_axis_2d
	
func _physics_process(delta: float) -> void:
	var screen_size = get_viewport_rect().size
	
	animation_tree.set("parameters/blend_position", velocity.normalized())
	
	if velocity.length() > 0:
		last_direction = velocity.normalized()
		velocity = last_direction * speed
		position += velocity * delta

	position = position.clamp(sprite_size / 2, screen_size - sprite_size / 2)
