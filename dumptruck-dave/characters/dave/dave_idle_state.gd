class_name DaveIdleState
extends IdleState

var scan_for_candy: float = 1.0

func _on_enter() -> void:
	super._on_enter()
	scan_for_candy = 1.0
	do_candy_scan()

func process(delta: float) -> void:
	super.process(delta)
	scan_for_candy -= delta
	if scan_for_candy <= 0:
		do_candy_scan()
	
func do_candy_scan() -> void:
	var dave: Dave = character as Dave
	var candy = dave.get_nearest_candy_cane()
	if candy:
		fsm.transition("Gobble")
	else:
		scan_for_candy = randf_range(1.0, 3.0)
