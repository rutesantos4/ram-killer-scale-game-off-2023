extends Object
class_name GameAsset

# Member variables.
var _full_size_image : Texture2D
var _icon_size_image : Texture2D

# Constructor
func _init(full_size_image : String, icon_size_image : String):
	_full_size_image = file_to_image(full_size_image);
	_icon_size_image = file_to_image(icon_size_image);
	
func get_full_size_image():
	return _full_size_image

func get_icon_image():
	return _icon_size_image
	
func file_to_image(file):
	var image = Image.load_from_file(file)
	return ImageTexture.create_from_image(image)
