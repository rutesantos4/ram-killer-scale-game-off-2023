extends Object
class_name GameAsset

# Member variables.
var _name: String

var _xs_image: LazyFileImage
var _s_image: LazyFileImage
var _m_image: LazyFileImage
var _xl_image: LazyFileImage

var _audio: LazyAudioStream

# Creates a game asset based on the file system pattern for assets
# (res://assets/images/<sizes>/<name>.png)
static func named(name: String):
	var fs_name = name.to_lower()
	
	return GameAsset.new(
		name,
		FileResolver.resolve_file_path("res://assets/images/xs/%s" % fs_name),
		FileResolver.resolve_file_path("res://assets/images/s/%s" % fs_name),
		FileResolver.resolve_file_path("res://assets/images/m/%s" % fs_name),
		FileResolver.resolve_file_path("res://assets/images/xl/%s" % fs_name),
		FileResolver.resolve_file_path("res://assets/sounds/%s" % fs_name),
	)

# Constructor
func _init(
	name: String, 
	xs_image_file: String,
	s_image_file: String,
	m_image_file: String,
	xl_image_file: String,
	audio_file
):
	_name = name
	_xs_image = LazyFileImage.new(xs_image_file)
	_s_image = LazyFileImage.new(s_image_file)
	_m_image = LazyFileImage.new(m_image_file)
	_xl_image = LazyFileImage.new(xl_image_file)
	_audio = LazyAudioStream.new(audio_file)
	
func get_name(): return _name
func xs(): return _xs_image.value()
func s(): return _s_image.value()
func m(): return _m_image.value()
func xl(): return _xl_image.value()
func audio(): return _audio.value()
