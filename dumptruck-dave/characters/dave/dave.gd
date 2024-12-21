class_name Dave
extends Character

func _ready() -> void:
	super._ready()
	assert(Globals.dave == null)
	Globals.dave = self

func get_nearest_candy_cane() -> Pickable:
	return null

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
