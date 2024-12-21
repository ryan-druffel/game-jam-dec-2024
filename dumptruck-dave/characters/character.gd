class_name Character
extends CharacterBody2D

var can_move = false
@export var speed = 300.0
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

@onready var sprite: AnimatedSprite2D = $Sprite2D

@onready var pickable: Pickable = $Pickable

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

func move(position: Vector2) -> void:
	collision_shape.disabled = true
	translate(position - global_position)
	collision_shape.disabled = false
