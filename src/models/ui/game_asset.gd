extends Object
class_name GameAsset

# Member variables.
var _name: String
var _xs_image: LazyFileImage
var _s_image: LazyFileImage
var _m_image: LazyFileImage
var _xl_image: LazyFileImage

# Creates a game asset based on the file system pattern for assets
# (res://assets/images/<sizes>/<name>.png)
static func named(name: String):
	var fs_name = name.to_lower()
	
	return GameAsset.new(
		name,
		"res://assets/images/xs/%s.png" % fs_name,
		"res://assets/images/s/%s.png" % fs_name,
		"res://assets/images/m/%s.png" % fs_name,
		"res://assets/images/xl/%s.png" % fs_name,
	)

# Constructor
func _init(
	name: String, 
	xs_image_file: String,
	s_image_file: String,
	m_image_file: String,
	xl_image_file: String
):
	_name = name
	_xs_image = LazyFileImage.new(xs_image_file);
	_s_image = LazyFileImage.new(s_image_file)
	_m_image = LazyFileImage.new(m_image_file);
	_xl_image = LazyFileImage.new(xl_image_file);
	
func get_name(): return _name
func xs(): return _xs_image.value()
func s(): return _s_image.value()
func m(): return _m_image.value()
func xl(): return _xl_image.value()
