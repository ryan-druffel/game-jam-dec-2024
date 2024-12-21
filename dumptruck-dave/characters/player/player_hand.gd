extends Area2D

enum HandStates {IDLE, FOLLOW, HOVER, GRAB}

@export var object_name : String = "none";
@export var hand			:	AnimatedSprite2D;
@export var hold_position	:	Node2D;

var hand_state		:	HandStates	=	HandStates.IDLE;
var mouse_in_zone	:	bool;

const MAX_FOLLOW_SPEED : float = 20;

# Called when the node enters the scene tree for the first time.
func _ready():
	input_pickable = true;
	self.connect("mouse_entered", self.onMouseOverlap);
	self.connect("mouse_exited", self.onMouseExit);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	match hand_state:
		HandStates.IDLE:
			hand.play("idle");
			goHome();
			if mouse_in_zone and not Input.is_mouse_button_pressed( 1 ):
				hand_state = HandStates.FOLLOW;
		HandStates.FOLLOW:
			hand.play("idle");
			followMousePosition();
			if not mouse_in_zone:
				hand_state = HandStates.IDLE;
			elif Input.is_mouse_button_pressed( 1 ):
				hand_state = HandStates.GRAB;
		HandStates.HOVER:
			followMousePosition();
		HandStates.GRAB:
			hand.play("held");
			snapToMousePosition();
			if not Input.is_mouse_button_pressed( 1 ):
				hand_state = HandStates.FOLLOW;
			
func goHome():
	var change : Vector2 = Utilities.logSmoothVector2(hold_position.global_position, hand.global_position, 0.1);
	hand.global_position += (change if change.length() < MAX_FOLLOW_SPEED else MAX_FOLLOW_SPEED * (hold_position.global_position - hand.global_position)) * get_process_delta_time();
			
func followMousePosition():
	var mouse_pos : Vector2 = get_global_mouse_position();
	var change : Vector2 = Utilities.logSmoothVector2(mouse_pos, hand.global_position, 0.1);
	hand.global_position += (change if change.length() < MAX_FOLLOW_SPEED else MAX_FOLLOW_SPEED * (mouse_pos - hand.global_position)) * get_process_delta_time();
	
func snapToMousePosition():
	var mouse_pos : Vector2 = get_global_mouse_position();
	var change : Vector2 = Utilities.logSmoothVector2(mouse_pos, hand.global_position, 0.05);
	hand.global_position += change * get_process_delta_time();
	

func onMouseOverlap():
	#print("Mouse over " + object_name);
	mouse_in_zone = true;

func onMouseExit():
	#print("Mouse exit " + object_name);
	mouse_in_zone = false;
