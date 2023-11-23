extends Control

var resume_button_node: Button
var mute_button_node: Button
var quit_button_node: Button

func _ready():
	resume_button_node = get_node("Resume")
	mute_button_node = get_node("Mute")
	quit_button_node = get_node("Quit")
	
	resume_button_node.connect("pressed", resume)
	mute_button_node.connect("pressed", mute)
	quit_button_node.connect("pressed", quit)

func resume():
	queue_free()
	pass

func mute():
	pass
	
func quit():
	pass
