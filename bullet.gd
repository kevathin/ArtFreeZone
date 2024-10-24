extends Area2D

var speed = 200
var direction: Vector2 = Vector2.UP
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += direction * speed * delta
	if position.x <= -20 || position.y <= -20 || position.x >= 420 || position.y >= 300:
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	body.hit()
	queue_free()
