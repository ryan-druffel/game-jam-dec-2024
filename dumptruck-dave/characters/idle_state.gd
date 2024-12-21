class_name IdleState
extends CharacterState

func process(delta: float) -> void:
	super.process(delta)
	character.velocity = character.velocity.move_toward(Vector2.ZERO, character.speed)
	character.move_and_slide()
