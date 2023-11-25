extends Object

class_name Game

var player: Player
var enemy: Browser
var map: GameMap
var cookies: Array[Cookie]
var ram: RAM
var status: GameStatus

func _init(
	player: Player,
	enemy: Browser,
	map: GameMap,
	cookies: Array[Cookie],
	ram: RAM
):
	self.player = player
	self.enemy = enemy
	self.map = map
	self.cookies = cookies
	self.ram = ram
	
	self.status = GameStatus.resumed

func pause():
	self.status = GameStatus.paused
	
func resume():
	self.status = GameStatus.resumed

func end():
	self.status = GameStatus.finished
	
func is_paused():
	return self.status == GameStatus.paused

func delete_cookie(cookie: Cookie):
	self.cookies.erase(cookie)

enum GameStatus {
	resumed,
	paused,
	finished
}
