extends Object

class_name CookieSpawner

static func generate(map_dimentions: Vector2, amount: int) -> Array[Cookie]:
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
				randi_range(-map_dimentions.x/2, map_dimentions.x/2),
				randi_range(-map_dimentions.y/2, map_dimentions.y/2)
			)
		)
		
		cookies.push_front(cookie)
		
	return cookies
