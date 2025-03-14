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

## Referensi
- https://youtu.be/Hpbn-w7H2V4?si=y29l62xfbiS28Qm8
- https://www.youtube.com/watch?v=IOe1aGY6hXA
- https://www.youtube.com/watch?v=DW4CQoYddXQ
- https://www.youtube.com/watch?v=tfdXgiMwUBw

# Tutorial 5
## Alden Luthfi (2206028932)

- Membuat minimal 1 (satu) objek baru di dalam permainan yang dilengkapi dengan animasi menggunakan spritesheet selain yang disediakan tutorial. Silakan cari spritesheet animasi di beberapa koleksi aset gratis seperti Kenney.

Jawab: Kebetulan saya sudah membuat beberapa aset tower sebelum semester ini dimulai, sehingga saya memakai salah satu dari asset itu untuk melambangkan goal untuk player

- Membuat minimal 1 (satu) audio untuk efek suara (SFX) dan memasukkannya ke dalam permainan. Kamu dapat membuatnya sendiri atau mencari dari koleksi aset gratis.

Jawab: 

- Membuat minimal 1 (satu) musik latar (background music) dan memasukkannya ke dalam permainan. Kamu dapat membuatnya sendiri atau mencari dari koleksi aset gratis.

Jawab: Saya menambahkan sebuah musik latar pada scene Main dari permainan sehingga musik latar tersebut terdengar selama permainan berjalan

- Implementasikan interaksi antara objek baru tersebut dengan objek yang dikendalikan pemain. Misalnya, pemain dapat menciptakan atau menghilangkan objek baru tersebut ketika menekan suatu tombol atau tabrakan dengan objek lain di dunia permainan.

Jawab: Denga Sprite Tower, object baru ini akan menjadi goal pemain. Ketika menyentuh pemain, maka permainan akan membuat screen baru yaitu win screen.

- Implementasikan audio feedback dari interaksi antara objek baru dengan objek pemain. Misalnya, muncul efek suara ketika pemain tabrakan dengan objek baru.

Jawab: 
