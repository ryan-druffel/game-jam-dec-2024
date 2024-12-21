extends Node2D

@export var scale_this : Node2D;

const MIN_SCALE	: float =	0.5;
const MAX_SCALE	: float =	2;

const SCREEN_SIZE_Y : float = 360;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if scale_this:
		var screen_frac : float = ((scale_this.get_global_transform_with_canvas().get_origin().y) / SCREEN_SIZE_Y);
		var scale_to : float = screen_frac * (MAX_SCALE - MIN_SCALE) + MIN_SCALE
		scale_this.scale = (Vector2(scale_to, scale_to))
