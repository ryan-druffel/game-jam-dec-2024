extends Area2D

enum HandStates {IDLE, FOLLOW, HOVER, GRAB}

@export var object_name : String = "none";
@export var hand			:	AnimatedSprite2D;
@export var hold_position	:	Node2D;

var hand_state		:	HandStates	=	HandStates.IDLE;
var mouse_in_zone	:	bool;

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
			followMousePosition();
			if not Input.is_mouse_button_pressed( 1 ):
				hand_state = HandStates.FOLLOW;
			
func goHome():
	hand.global_position += Utilities.smoothedMoveCarryThing(hold_position.global_position, hand.global_position) * get_physics_process_delta_time();
			
func followMousePosition():
	var mouse_pos : Vector2 = get_global_mouse_position();
	hand.global_position += Utilities.smoothedMoveCarryThing(mouse_pos, hand.global_position) * get_physics_process_delta_time();
	

func onMouseOverlap():
	#print("Mouse over " + object_name);
	mouse_in_zone = true;

func onMouseExit():
	#print("Mouse exit " + object_name);
	mouse_in_zone = false;
