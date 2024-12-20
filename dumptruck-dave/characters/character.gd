class_name Character
extends CharacterBody2D


@export var speed = 300.0

func _ready() -> void:
	Globals.character_entered.emit(self)

func get_input() -> void:
	pass

func get_movement() -> Vector2:
	return Vector2.ZERO

func _physics_process(delta: float) -> void:
	var direction: Vector2 = get_movement()
	if direction:
		velocity.x = direction.x * speed
		velocity.y = direction.y * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
