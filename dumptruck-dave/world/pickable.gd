class_name Pickable
extends CollisionObject2D

signal pick_up()
signal move(target_pos: Vector2)
signal drop()

@export var disabled = false
var hovered = false
var picked = false

@export var pickup_offset : Vector2;

func _ready() -> void:
	Globals.pickable_entered.emit(self)


func _input(event: InputEvent) -> void:
	if disabled:
		return
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if picked and event.is_released():
			depick()
		elif event.is_pressed() and can_pick():
			pick()
#func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		#print("pressed")
		#pressed = event.is_pressed()
	
func can_pick() -> bool:
	return not Globals.picked and hovered

func pick() -> void:
	Globals.picked = self
	picked = true
	pick_up.emit()

func depick() -> void:
	if not picked:
		return
	if Globals.picked == self:
		Globals.picked = null
	picked = false
	drop.emit()

func _on_mouse_entered() -> void:
	hovered = true

func _on_mouse_exited() -> void:
	hovered = false

func _physics_process(delta: float) -> void:
	if picked:
		var mouse_pos: Vector2 = get_global_mouse_position()
		move.emit(mouse_pos + pickup_offset)

func remove() -> void:
	Globals.pickable_exited.emit(self)
	queue_free()
