extends Node

var object_name : String = "none";

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func onMouseOverlap():
	print("Mouse over " + object_name);
