extends Node

@export var tab : PackedScene

func _on_enemy_spawn_tab(tabs: Array[Tab]):
	for _tab in tabs:
		var t = tab.instantiate()
		
		t.set_texture(_tab.skin.texture)
		t.position = _tab.position
		t.value = _tab

		add_child(t)
