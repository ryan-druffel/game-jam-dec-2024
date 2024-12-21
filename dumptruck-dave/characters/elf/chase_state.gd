class_name ChaseState
extends CharacterState

@export var distance_threshold = 30
@export var chase_completed_transition = "Seduce"

func process(delta: float) -> void:
	super.process(delta)
	var dave: Dave = Globals.dave
	var offset = dave.global_position - character.global_position
	character.velocity = character.speed * offset
	character.move_and_slide()
	if character.global_position.distance_to(dave.global_position) < distance_threshold:
		fsm.transition(chase_completed_transition)
	
