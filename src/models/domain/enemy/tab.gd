extends Enemy

class_name Tab

var browser: Browser

func _init(
	skin: SkinAsset,
	initial_position: Vector2,
	initial_memory_size: float,
	browser: Browser
):
	super(skin, initial_position, initial_memory_size)
	
	self.browser = browser
	
func consume(cookie: Cookie):
	super.consume(cookie)
	
	browser.on_tab_cookie_consume(cookie)
