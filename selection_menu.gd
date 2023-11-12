extends Control

@export var option_button_operating_system_path : NodePath
@onready var option_button_operating_system = get_node(option_button_operating_system_path)

@export var option_button_browser_to_fight_path : NodePath
@onready var option_button_browser_to_fight = get_node(option_button_browser_to_fight_path)

@export var option_button_map_path : NodePath
@onready var option_button_map = get_node(option_button_map_path)

func _on_back_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_play_pressed():
	var operating_system_icon = option_button_operating_system.get_item_icon(option_button_operating_system.get_selected_id())
	var browser_to_fight_icon = option_button_browser_to_fight.get_item_icon(option_button_browser_to_fight.get_selected_id())
	var map_icon = option_button_map.get_item_icon(option_button_map.get_selected_id())
	SceneSwitcher.change_scene("res://game.tscn", GameInfo.new(browser_to_fight_icon, operating_system_icon, map_icon))

