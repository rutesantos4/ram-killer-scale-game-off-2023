extends Object

class_name Game

var player: Player
var enemy: Enemy
var map: GameMap
var cookies: Array[Cookie]
var ram: RAM

func _init(
	player: Player,
	enemy: Enemy,
	map: GameMap,
	cookies: Array[Cookie],
	ram: RAM
):
	self.player = player
	self.enemy = enemy
	self.map = map
	self.cookies = cookies
	self.ram = ram
