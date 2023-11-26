extends Object

class_name FileResolver

static var supported_extensions = [
	".png",
	".svg",
	".ogg",
	".mp3",
	".wav",
	".flac"
]

# Tries to resolve the file path of a resource that has been imported by Godot
# e.g., resolve_file_path("res://assets/images/xs/chrome") will return "res://assets/images/xs/chrome.svg"
static func resolve_file_path(
	file_path: String
):
	for extension in supported_extensions:
		var target_file_path = "%s%s" % [file_path, extension]
		
		if(ResourceLoader.exists(target_file_path)):
			return target_file_path
			
	return file_path
