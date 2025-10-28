extends CharacterBody2D

@onready var animation_tree: AnimationTree = $AnimationTree

## The speed of the player.
@export var speed: float = 100

## The action that moves the player.
@export var move_action: GUIDEAction

## The action for attacking.
@export var attack_action: GUIDEAction

var facing: Vector2 = Vector2.ZERO
var is_attacking: bool = false


func _process(_delta: float) -> void:
	is_attacking = attack_action.is_triggered()

	if move_action.value_axis_2d.length() > 0.0:
		facing = move_action.value_axis_2d.normalized()

		if is_attacking:
			velocity = Vector2.ZERO
		else:
			velocity = move_action.value_axis_2d * speed
	else:
		velocity = Vector2.ZERO


func _physics_process(_delta: float) -> void:
	animation_tree.set("parameters/idle/blend_position", facing)
	animation_tree.set("parameters/walk/blend_position", facing)
	animation_tree.set("parameters/attack/blend_position", facing)

	move_and_slide()
