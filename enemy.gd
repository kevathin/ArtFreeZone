extends CharacterBody2D

var health = 3
var speed = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	position = Vector2(position.x + speed, position.y + speed)
	if position.x >= 400:
		position.x = -20
	if position.y >= 256:
		position.y = -20
	pass

func shoot():
	pass

func hit():
	health -= 1
	if health == 0:
		queue_free()
