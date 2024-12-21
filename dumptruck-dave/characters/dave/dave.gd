class_name Dave
extends Character

@onready var candy_area2d: Area2D = $CandyCaneArea2D

func _ready() -> void:
	super._ready()
	assert(Globals.dave == null)
	Globals.dave = self

func get_nearest_candy_cane() -> Item:
	var areas: Array[Area2D] = candy_area2d.get_overlapping_areas()
	print(areas)
	var distance: float = 999999
	var closest_item: Item = null
	for area in areas:
		var area_dist = global_position.distance_to(area.global_position)
		if area_dist < distance and area is CandyCane:
			var candy_cane: CandyCane = area as CandyCane
			if not candy_cane.disappeared:
				distance = area_dist
				closest_item = area
	return closest_item

func _physics_process(delta: float) -> void:
	super._physics_process(delta)
