class_name Tick extends Object

var interval: float = .25
var last_tick = .25

func _init(interval: float) -> void:
	self.interval = interval
	self.last_tick = interval

func tick(delta: float) -> bool:
	last_tick += delta
	if last_tick >= interval:
		last_tick = 0.0
		return true
	else:
		return false
	
