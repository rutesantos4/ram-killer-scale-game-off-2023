extends Node

@export var tab : PackedScene

func _on_enemy_spawn_tab(tabs: Array[Tab]):
	for _tab in tabs:
		var t = tab.instantiate()
		
		t.enemy = _tab

		add_child(t)
