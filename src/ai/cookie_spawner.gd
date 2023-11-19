extends Object

class_name CookieSpawner

const COOKIE_MIN_POSITION = -2000
const COOKIE_MAX_POSITION = 2000

static func generate(amount: int):	
	var cookies: Array[Cookie] = []
	
	var cookie_skin = SkinAsset.new(
		GameAssetsFactory.Cookie.get_name(),
		GameAssetsFactory.Cookie.s(),
	)
	
	randomize()
	
	for i in amount:
		var cookie = Cookie.new(
			cookie_skin,
			Vector2(
				randi_range(COOKIE_MIN_POSITION, COOKIE_MAX_POSITION),
				randi_range(COOKIE_MIN_POSITION, COOKIE_MAX_POSITION)
			)
		)
		
		cookies.push_front(cookie)
		
	return cookies
