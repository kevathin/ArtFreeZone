extends Area2D

var Mouse_position
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Mouse_position = get_local_mouse_position()
	rotation += Mouse_position.angle() + (PI/2)
	pass
