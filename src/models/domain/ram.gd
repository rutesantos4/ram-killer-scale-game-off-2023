extends Object

class_name RAM

var current_memory_size: float
var max_memory_size: float

func _init(
	initial_memory_size: float,
	max_memory_size: float
):
	current_memory_size = initial_memory_size
	max_memory_size = max_memory_size

func increase(cookie: Cookie):
	current_memory_size += cookie.memory_size
	
func decrease(cookie: Cookie):
	current_memory_size -= cookie.memory_size
