class_name CandyCane extends Item

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	super._ready()

func get_gobbled() -> void:
	$Debris.emitting = true
	pickable.disabled = true
	anim.play("Gobble")

func disappear() -> void:
	super.disappear()
	$Debris.emitting = false
