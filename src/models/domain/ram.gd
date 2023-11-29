extends Object

class_name RAM

var current_memory_size: float
var max_memory_size: float
var threshold: float

func _init(
	initial_memory_size: float,
	max_memory_size: float
):
	current_memory_size = initial_memory_size
	self.max_memory_size = max_memory_size
	threshold = initial_memory_size * 1.5

func increase(cookie: Cookie):
	current_memory_size += cookie.memory_size

func decrease(cookie: Cookie):
	current_memory_size -= cookie.memory_size

func decrease_from_tab_close(tab: Tab):
	current_memory_size -= tab.memory_size

func has_surpassed_threshold() -> bool:
	return current_memory_size > threshold

func has_reached_max_capacity() -> bool:
	return current_memory_size >= max_memory_size
