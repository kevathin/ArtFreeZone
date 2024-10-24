extends Node2D

@export var enemy_scene: PackedScene
var num_of_enemies = 0
var level = 1
var spawn_rate = 4
var spawn_timer = 4
var num_of_enemies_in_level = 1
var num_of_enemies_spawned = 0

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	spawn_timer -= delta
	if spawn_timer <= 0 && num_of_enemies_spawned < num_of_enemies_in_level:
		spawn_enemy()
		num_of_enemies_spawned += 1
		num_of_enemies += 1
		spawn_timer = spawn_rate
		
	if num_of_enemies == 0 && num_of_enemies_spawned >= num_of_enemies_in_level:
		spawn_rate = spawn_rate - (4 * spawn_rate/100)
		num_of_enemies_in_level = level * 1.5
		num_of_enemies_spawned = 0
		spawn_timer = spawn_rate 
	pass

func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	
	enemy.position = Vector2(randf_range(20,380), 20)
	
	add_child(enemy)
