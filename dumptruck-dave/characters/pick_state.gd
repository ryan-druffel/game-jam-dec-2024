extends CharacterState
class_name PickState

func move(position: Vector2) -> void:
	if active:
		character.collision_shape.disabled = true
		character.translate(position - character.global_position)
		character.collision_shape.disabled = false
