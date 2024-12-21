class_name Item
extends Area2D

@onready var anim: AnimationPlayer = $AnimationPlayer
@onready var pickable: Pickable = $Pickable
@onready var collision_shape: CollisionShape2D = $CollisionShape2D
var disappeared = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.item_entered.emit(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_pickable_drop() -> void:
	pass # Replace with function body.


func _on_pickable_pick_up() -> void:
	pass # Replace with function body.


func _on_pickable_move(target_pos: Vector2) -> void:
	translate(target_pos - global_position)

func disappear() -> void:
	if !disappeared:
		collision_shape.disabled = true
		disappeared = true
		anim.play("Disappear")
		Globals.item_exited.emit(self)

func destroy() -> void:
	queue_free()
