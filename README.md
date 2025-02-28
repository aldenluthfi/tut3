# Tutorial 3
## Alden Luthfi (2206028932)

- Double Jump
Double jump diimplementasikan dengan kode ini
```
	if is_on_floor() and Input.is_action_just_pressed('ui_up'):
		velocity.y = jump_speed
		can_doublejump = true
	
	elif can_doublejump and Input.is_action_just_pressed('ui_up'):
		velocity.y = jump_speed
		can_doublejump = false
```

kode ini membuat player hanya bisa melompat sekali ketika sedang di udara, karena setelah melompat kedua kali, can_doublejump akan menjadi false 
- Crouching
Implementasi crouching cukup simple
```
	if Input.is_key_pressed(KEY_SHIFT):
		scale.y = 0.9
	else:
		scale.y = 1
```
kode ini akan memendekkan sprite player ketika tombol shoft ditekan
- Dashing
Fitur ini lumayan menantang untuk diimplementasikan
```
	if Input.is_action_just_pressed("ui_right"):
		if sum_delta - dash_delta < 30*delta and sum_delta - last_dash > 2:
			velocity.x = 8000
			last_dash = sum_delta
		dash_delta = sum_delta
	
	if Input.is_action_just_pressed("ui_left"):
		if sum_delta - dash_delta < 30*delta and sum_delta - last_dash > 2:
			velocity.x = -8000
			last_dash = sum_delta
		dash_delta = sum_delta
```
sum_delta adalah waktu kumulatif yang berjalan selama game running, dash_delta adalah waktu dmana tombol ditekan dan last_dash adalah waktu dash terakhir, kode ini akan melakukan dash ke kiri maupun ke kanan ketika tombol ditekan dua kali dalam waktu kurang dari setengah detik, dash juga memiliki cooldown 2 detik
- Sprite Flip
Sprite flip diimplementasikan dengan mengubah nilai `flip_h` pada sprite
```
	if Input.is_action_just_pressed("ui_right"):
		$Sprite2D.flip_h = false
		if sum_delta - dash_delta < 30*delta and sum_delta - last_dash > 2:
			velocity.x = 8000
			last_dash = sum_delta
		dash_delta = sum_delta
	
	if Input.is_action_just_pressed("ui_left"):
		$Sprite2D.flip_h = true
		if sum_delta - dash_delta < 30*delta and sum_delta - last_dash > 2:
			velocity.x = -8000
			last_dash = sum_delta
		dash_delta = sum_delta
```
