extends Node2D

@export var scale_this : Node2D;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if scale_this:
		var scale_to : float = Utilities.get_scale_with_screen_factor(scale_this.get_global_transform_with_canvas().get_origin().y)
		scale_this.scale = (Vector2(scale_to, scale_to))
