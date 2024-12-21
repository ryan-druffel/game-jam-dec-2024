extends CharacterState
class_name PickState

func move(position: Vector2) -> void:
	if active:
		character.collision_shape.disabled = true
		character.translate(Utilities.smoothedMoveCarryThing(position, character.position) * get_physics_process_delta_time())
		character.collision_shape.disabled = false
		character.sprite.flip_h = Globals.in_left_hand
