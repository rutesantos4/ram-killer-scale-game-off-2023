extends Control

@export var option_button_operating_system_path : NodePath
@onready var option_button_operating_system = get_node(option_button_operating_system_path)

@export var option_button_browser_to_fight_path : NodePath
@onready var option_button_browser_to_fight = get_node(option_button_browser_to_fight_path)

@export var option_button_map_path : NodePath
@onready var option_button_map = get_node(option_button_map_path)

func _ready():
	var enemies_size = GameAssetsFactory.Enemies.size()
	for i in range(0, enemies_size):
		var enemy = GameAssetsFactory.Enemies[i]
		option_button_browser_to_fight.add_icon_item(enemy.get_icon_image(), enemy.get_name(), i)
		
	var players_size = GameAssetsFactory.Players.size()
	for i in range(0, players_size):
		var player = GameAssetsFactory.Players[i]
		option_button_operating_system.add_icon_item(player.get_icon_image(), player.get_name(), i)
		
	var maps_size = GameAssetsFactory.Maps.size()
	for i in range(0, maps_size):
		var map = GameAssetsFactory.Maps[i]
		option_button_map.add_icon_item(map.get_icon_image(), map.get_name(), i)
	

func _on_back_pressed():
	get_tree().change_scene_to_file("res://main_menu.tscn")

func _on_play_pressed():
	var player_selected = option_button_operating_system.get_selected_id();
	var enemy_selected = option_button_browser_to_fight.get_selected_id();
	var map_selected = option_button_map.get_selected_id();
	
	SceneSwitcher.change_scene("res://game.tscn", GameInfo.new(
		GameAssetsFactory.Players[player_selected].get_full_size_image(),
		GameAssetsFactory.Enemies[enemy_selected].get_full_size_image(),
		GameAssetsFactory.Maps[map_selected].get_full_size_image()))
