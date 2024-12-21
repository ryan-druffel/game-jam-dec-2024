class_name Utilities

const MAX_FOLLOW_SPEED : float = 20;

# Iso stuff
const MIN_SCALE	: float =	0.5;
const MAX_SCALE	: float =	2;
const SCREEN_SIZE_Y : float = 360;

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

static func smoothedMoveCarryThing(target : Vector2, current : Vector2):
	var change : Vector2 = Utilities.logSmoothVector2(target, current, 0.05);
	return change if change.length() < MAX_FOLLOW_SPEED else MAX_FOLLOW_SPEED * (target - current);
	
static func get_scale_with_screen_factor(vert_screen_position : float) -> float:
	var screen_frac : float = (vert_screen_position / SCREEN_SIZE_Y);
	var scale_to : float = screen_frac * (MAX_SCALE - MIN_SCALE) + MIN_SCALE
	return scale_to
