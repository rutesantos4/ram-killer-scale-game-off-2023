extends Object
class_name GameAsset

# Member variables.
var _name : String
var _full_size_image_file : String
var _icon_size_image_file : String

# Constructor
func _init(name : String, full_size_image : String, icon_size_image : String):
	_name = name
	_full_size_image_file = full_size_image;
	_icon_size_image_file = icon_size_image;
	
func get_name():
	return _name

func get_full_size_image():
	return file_to_image(_full_size_image_file)

func get_icon_image():
	return file_to_image(_icon_size_image_file)
	
func file_to_image(file):
	var image = Image.load_from_file(file)
	return ImageTexture.create_from_image(image)
