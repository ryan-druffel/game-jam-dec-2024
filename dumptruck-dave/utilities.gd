class_name Utilities

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

static func logSmooth(target : float, current : float, factor : float = 0.5):
	return (abs(target - current) * log(abs(target - current) + 1.0) / factor) * sign(target - current);

static func logSmoothVector2(target : Vector2, current : Vector2, factor : float = 0.5):
	var vec : Vector2 = Vector2.ZERO;
	vec.x = logSmooth(target.x, current.x, factor);
	vec.y = logSmooth(target.y, current.y, factor);
	return vec;
