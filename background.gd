extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func hit():
	var rgb_picker = roundf(randf()*3)
	print("yes")
	#Red, green, blue
	if rgb_picker == 0:
		#Red, green
		$Sprite2D.modulate = Color(colour_picker(), colour_picker(), 0)
		pass
	elif rgb_picker == 1:
		#Red, blue
		$Sprite2D.modulate = Color(colour_picker(), 0, colour_picker())
		pass
	elif rgb_picker == 2:
		#blue, green
		$Sprite2D.modulate = Color(0, colour_picker(), colour_picker())
		pass
func colour_picker():
	return roundf(randf() * 256)



func _on_body_entered(body: Node2D) -> void:
	if body.has_method("hitpaint"):
		if body.hitpaint():
			hit()

func _on_body_exited(body: Node2D) -> void:
	if body.has_method("hitpaint"):
		if body.hitpaint():
			hit()
