extends Object

class_name Game

var player: Player
var enemy: Browser
var map: GameMap
var cookies: Array[Cookie]
var ram: RAM
var status: GameStatus
var cookies_spawned_count: int

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
	self.cookies_spawned_count = cookies.size()

func pause():
	self.status = GameStatus.paused
	
func resume():
	self.status = GameStatus.resumed

func end():
	self.status = GameStatus.finished
	
func is_paused():
	return self.status == GameStatus.paused
	
func is_finished():
	return self.status == GameStatus.finished
	
func delete_cookie(cookie: Cookie):
	self.cookies.erase(cookie)
	
func add_cookies(cookies: Array[Cookie]):
	self.cookies.append_array(cookies)
	self.cookies_spawned_count += cookies.size()

enum GameStatus {
	resumed,
	paused,
	finished
}
