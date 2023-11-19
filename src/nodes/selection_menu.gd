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
		option_button_browser_to_fight.add_icon_item(enemy.xs(), enemy.get_name(), i)
		
	var players_size = GameAssetsFactory.Players.size()
	for i in range(0, players_size):
		var player = GameAssetsFactory.Players[i]
		option_button_operating_system.add_icon_item(player.xs(), player.get_name(), i)
		
	var maps_size = GameAssetsFactory.Maps.size()
	for i in range(0, maps_size):
		var map = GameAssetsFactory.Maps[i]
		option_button_map.add_icon_item(map.xs(), map.get_name(), i)
	

func _on_back_pressed():
	get_tree().change_scene_to_file("res://src/scenes/main_menu.tscn")

func _on_play_pressed():
	var player_selected = option_button_operating_system.get_selected_id();
	var enemy_selected = option_button_browser_to_fight.get_selected_id();
	var map_selected = option_button_map.get_selected_id();
	
	#TODO: change player and enemy positions
	SceneSwitcher.change_scene(
		"res://src/scenes/game.tscn", 
		Game.new(
			Player.new(
				SkinAsset.new(
					GameAssetsFactory.Players[player_selected].get_name(),
					GameAssetsFactory.Players[player_selected].m()
				),
				Vector2(0, 0)
			),
			Browser.new(
				SkinAsset.new(
					GameAssetsFactory.Enemies[enemy_selected].get_name(),
					GameAssetsFactory.Enemies[enemy_selected].m()
				),
				Vector2(150, 150),
				100,
				#TODO: create electrical shock skin
				SkinAsset.new(
					GameAssetsFactory.Enemies[enemy_selected].get_name(),
					GameAssetsFactory.Enemies[enemy_selected].xs()
				),
			),
			GameMap.new(
				SkinAsset.new(
					GameAssetsFactory.Maps[map_selected].get_name(),
					GameAssetsFactory.Maps[map_selected].xl()
				),
			),
			CookieSpawner.generate(100)
		)
	)
