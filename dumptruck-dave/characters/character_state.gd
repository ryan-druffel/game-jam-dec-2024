class_name CharacterState
extends State

var character: Character
@export var can_pick: bool = true
@export var fixed_duration: float = -1.0
@export var default_transition = "Idle"

func _ready() -> void:
	super._ready()
	character = get_parent().get_parent() as Character
	await character.ready
	character.pickable.pick_up.connect(pick_up)
	character.pickable.drop.connect(drop)
	character.pickable.move.connect(move)

func _on_enter() -> void:
	super._on_enter()
	time_in_state = 0.0
	print("Entering %s state" % name)
	character.sprite.play(name)

func _on_exit() -> void:
	print("Exiting %s state" % name)

func process(delta: float) -> void:
	super.process(delta)
	if fixed_duration > 0 and time_in_state > fixed_duration and default_transition != "":
		fsm.transition(default_transition)

func move(position: Vector2) -> void:
	pass

func pick_up() -> void:
	if active and can_pick:
		fsm.transition("Pick")

func drop() -> void:
	if active:
		fsm.transition("Drop")
