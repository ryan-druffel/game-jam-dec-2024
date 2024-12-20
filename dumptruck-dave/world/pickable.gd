class_name Pickable
extends Area2D

var pickable = false
var pressed = false

func _ready() -> void:
	Globals.pickable_entered.emit(self)

func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		pressed = event.pressed

func _on_mouse_entered() -> void:
	pickable = true

func _on_mouse_exited() -> void:
	pickable = false

func _physics_process(delta: float) -> void:
	if pressed:
		var mouse_pos: Vector2 = get_global_mouse_position()
		global_position = global_position.move_toward(mouse_pos, 50)

func remove() -> void:
	Globals.pickable_exited.emit(self)
	queue_free()
