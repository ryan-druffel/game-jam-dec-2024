class_name Dave
extends Character

func _ready() -> void:
	super._ready()

func get_nearest_candy_cane() -> Pickable:
	return null

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
