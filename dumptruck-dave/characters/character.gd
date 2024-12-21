class_name Character
extends CharacterBody2D

var can_move = false
@export var speed = 300.0
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

@onready var sprite: AnimatedSprite2D = $Sprite2D

@onready var pickable: Pickable = $Pickable
var past_locations: Array[Vector2] = []
var location_tick: Tick = Tick.new(.25)

func _ready() -> void:
	Globals.character_entered.emit(self)
	past_locations.push_front(global_position)

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
	process_location(delta)

func process_location(delta: float) -> void:
	if location_tick.tick(delta):
		past_locations.push_front(global_position)
		if past_locations.size() > 10:
			past_locations.pop_back()
			
func get_location(index: float) -> Vector2:
	var size = past_locations.size()
	if size > index:
		return past_locations[index]
	elif size > 0:
		return past_locations[size - 1]
	else:
		return Vector2.ZERO

func move(position: Vector2) -> void:
	collision_shape.disabled = true
	translate(position - global_position)
	collision_shape.disabled = false
