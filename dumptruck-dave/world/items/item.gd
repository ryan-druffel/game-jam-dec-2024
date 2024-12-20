extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func move(position: Vector2) -> void:
	translate(position - global_position)


func _on_pickable_drop() -> void:
	pass # Replace with function body.


func _on_pickable_pick_up() -> void:
	pass # Replace with function body.
