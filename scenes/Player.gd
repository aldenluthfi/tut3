extends CharacterBody2D

@export var gravity = 500.0
@export var walk_speed = 200
@export var jump_speed = -300
@export var can_doublejump = false
@export var dash_delta = 0
@export var sum_delta = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _physics_process(delta):
	velocity.y += delta * gravity
	
	if is_on_floor() and Input.is_action_just_pressed('ui_up'):
		velocity.y = jump_speed
		can_doublejump = true
	
	elif can_doublejump and Input.is_action_just_pressed('ui_up'):
		velocity.y = jump_speed
		can_doublejump = false
			
	velocity.x = walk_speed*Input.get_action_strength("ui_right") - walk_speed*Input.get_action_strength("ui_left")

	if Input.is_action_just_pressed("ui_right"):
		if sum_delta - dash_delta < 30*delta:
			velocity.x = 8000
		dash_delta = sum_delta
	
	if Input.is_action_just_pressed("ui_left"):
		if sum_delta - dash_delta < 30*delta:
			velocity.x = -8000
		dash_delta = sum_delta
		
	if Input.is_key_pressed(KEY_SHIFT):
		scale = Vector2(0.9, 0.9)
	else:
		scale = Vector2(1, 1)

	move_and_slide()
	sum_delta += delta
