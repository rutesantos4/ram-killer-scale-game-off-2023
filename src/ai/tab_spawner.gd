extends Object

class_name TabSpawner

const TAB_MEMORY_SIZE = 10
const MAX_RADIUS_SPAWN_TAB = 200

static func generate(browser: Browser, maximum_tabs_joint_memory_size: int) -> Array[Tab]:
	randomize()
	var tabs: Array[Tab] = []
	var max_tabs_to_spawn = maximum_tabs_joint_memory_size / TAB_MEMORY_SIZE
	var tabs_to_spawn = randi_range(1, min(max_tabs_to_spawn, 6))
	
	for i in tabs_to_spawn:
		var tab = Tab.new(
				generate_tab_skin(),
				calculate_tab_position(browser.position),
				TAB_MEMORY_SIZE,
				browser
			)
		tabs.push_front(tab)
		browser.spawn_tabs.push_front(tab)
		browser.memory_size += TAB_MEMORY_SIZE
	
	return tabs


static func generate_tab_skin():
		var tabs = GameAssetsFactory.Tabs
		var index = randi_range(0, tabs.size() - 1)
		var tab = tabs[index]
		return SkinAsset.new(tab.get_name(), tab.s())


static func calculate_tab_position(center: Vector2) -> Vector2:
	randomize()
	var angle = randf_range(0, PI * 2)
	var radius = randf_range(1, MAX_RADIUS_SPAWN_TAB)
	var direction = Vector2(cos(angle), sin(angle))
	
	return center + direction * radius
