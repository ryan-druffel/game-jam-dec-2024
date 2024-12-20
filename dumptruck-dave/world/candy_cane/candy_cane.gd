class_name CandyCane extends Pickable


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.candy_cane_entered.emit(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
