extends Node
class_name StateMachine

var states: Array[State]
var active_state: State
var last_state: State = null
@export var initial_state: State

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_parent().ready
	states.assign(get_children())
	transition(initial_state.name)

func transition(next_state_string: String) -> void:
	var next_state: State = get_state(next_state_string)
	if !next_state:
		printerr("ERROR: Next state is null!")
		return
	if next_state == active_state:
		return
	if active_state:
		active_state._on_exit()
		last_state = active_state
	active_state = next_state
	active_state._on_enter()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_state(state_name: String) -> State:
	for child in get_children():
		if child.name == state_name:
			return child as State
	return null

func _physics_process(delta: float) -> void:
	if active_state:
		active_state.process(delta)
	else:
		printerr("No active state to process!")
	
