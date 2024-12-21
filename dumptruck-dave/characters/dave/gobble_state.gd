class_name GobbleState
extends CharacterState

var candy_cane: CandyCane

func _on_enter() -> void:
	super._on_enter()
	var dave: Dave = character as Dave
	candy_cane = dave.get_nearest_candy_cane()
	if candy_cane:
		candy_cane.get_gobbled()
	else:
		fsm.transition(default_transition)

func process(delta: float) -> void:
	super.process(delta)

func _on_exit() -> void:
	super._on_exit()
	if candy_cane and time_in_state >= fixed_duration:
		candy_cane.disappear()
