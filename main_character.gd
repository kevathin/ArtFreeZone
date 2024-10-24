extends CharacterBody2D


signal paint_the_world
const SPEED = 150.0
const JUMP_VELOCITY = -375.0
var direction

func _physics_process(delta: float) -> void:
	# Add the gravity.
	
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	if Input.is_action_pressed("left"):
		direction = -1
	elif  Input.is_action_pressed("right"):
		direction = 1
	else:
		direction = 0
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func hit():
	emit_signal("paint_the_world")
	pass
