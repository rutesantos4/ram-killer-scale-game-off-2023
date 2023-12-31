extends Node2D

class_name GameScene

signal player_health_updated
signal player_energy_updated
signal player_points_updated
signal ram_updated
signal game_status_updated
signal existing_cookies_updated

func _ready():
	AudioScene.switch_bgm(GameAssetsFactory.GameBGM)
