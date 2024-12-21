extends Node
class_name State

var time_in_state: float = 0.0
var fsm: StateMachine
var active = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	fsm = get_parent() as StateMachine


func _on_enter() -> void:
	time_in_state = 0.0
	active = true

func _on_exit() -> void:
	active = false

func process(delta: float) -> void:
	time_in_state += delta
	
func check_transition() -> String:
	return ""
