extends CharacterBody2D
var paint_ball_velocity = 0.5
var time_till_boom = randf() * 4
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_till_boom -= delta
	position.y = position.y + paint_ball_velocity
	paint_ball_velocity += 0.01

func hitpaint():
	if time_till_boom <= 0:
		queue_free()
		return true
