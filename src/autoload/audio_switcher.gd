extends Node2D

var bgm_player: AudioStreamPlayer
var sfx_player: AudioStreamPlayer

func _ready():
	bgm_player = get_node("BGMPlayer")
	sfx_player = get_node("SFXPlayer")

func switch_bgm(
	asset: GameAsset
):
	bgm_player.stream = asset.audio()
	bgm_player.play()
	
func play_sfx(
	asset: GameAsset
):
	sfx_player.stream = asset.audio()
	sfx_player.play()
