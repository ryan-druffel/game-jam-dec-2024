extends Node2D

@export var scale_target : Node2D;
@export var order_target : Node2D;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if scale_target:
		# scale
		var scale_to : float = Utilities.get_scale_with_screen_factor(scale_target.get_global_transform_with_canvas().get_origin().y)
		scale_target.scale = (Vector2(scale_to, scale_to))
	if order_target:
		# order
		var order_to : float = Utilities.get_order_with_screen_factor(scale_target.get_global_transform_with_canvas().get_origin().y)
		order_target.z_index = order_to
		
