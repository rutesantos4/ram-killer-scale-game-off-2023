extends Node2D

var bgm_player: AudioStreamPlayer
var sfx_player: AudioStreamPlayer

var muted: bool

func _ready():
	bgm_player = get_node("BGMPlayer")
	sfx_player = get_node("SFXPlayer")

	muted = false

func switch_bgm(
	asset: GameAsset
):
	var audio = asset.audio()
	if(bgm_player.stream != audio):
		bgm_player.stream = audio
		bgm_player.play()
	
func play_sfx(
	asset: GameAsset
):
	sfx_player.stream = asset.audio()
	sfx_player.play()

func mute():
	AudioServer.set_bus_mute(AudioServer.get_bus_index(bgm_player.bus), true)
	AudioServer.set_bus_mute(AudioServer.get_bus_index(sfx_player.bus), true)
	muted = true

func unmute():
	print("world")
	AudioServer.set_bus_mute(AudioServer.get_bus_index(bgm_player.bus), false)
	AudioServer.set_bus_mute(AudioServer.get_bus_index(sfx_player.bus), false)
	muted = false
	
func is_muted():
	return muted
