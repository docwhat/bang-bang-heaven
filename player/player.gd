extends Area2D

@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

## The speed of the player.
@export var speed:float = 100

## The action that moves the player.
@export var move_action:GUIDEAction

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animated_sprite_2d.play(&"idle_front")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += move_action.value_axis_2d * speed * delta
