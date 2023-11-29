extends Object

class_name RAM

const MIN_LIMIT_TO_DECREASE = 20

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
	
func decrease(value: float):
	if(can_decrease()): 
		print("value ", value)
		current_memory_size -= value

func has_surpassed_threshold() -> bool:
	return current_memory_size > threshold

func has_reached_max_capacity() -> bool:
	return current_memory_size >= max_memory_size

func can_decrease() -> bool:
	return current_memory_size > MIN_LIMIT_TO_DECREASE
