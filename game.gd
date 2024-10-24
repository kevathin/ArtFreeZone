extends Node2D
@export var bullet_scen: PackedScene
@export var enemy_scene: PackedScene
signal enemy_change()
var num_of_enemies = 0
var level = 1
var spawn_rate = 4
var spawn_timer = 4
var num_of_enemies_in_level = 1
var num_of_enemies_spawned = 0
var BulletReload = 2
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	spawn_timer -= delta
	if BulletReload >= 0:
		BulletReload -= delta
	if Input.is_action_just_pressed("left_click") && BulletReload <= 0:
		BulletReload = 2
		spawn_bullets()
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
		level += 1
	pass

func spawn_enemy():
	var enemy = enemy_scene.instantiate()
	
	enemy.position = Vector2(randf_range(20,380), 20)
	
	add_child(enemy)
func spawn_bullets():
	
	var bullet = bullet_scen.instantiate()
	bullet.position = Vector2($player.position.x, $player.position.y)
	var Mouse_position = get_local_mouse_position()
	bullet.rotation_degrees = rad_to_deg(((get_global_mouse_position()- $player.position).normalized()).angle()) + 90
	bullet.direction = (get_global_mouse_position()- $player.position).normalized()
	add_child(bullet)


func _on_child_exiting_tree(node: Node) -> void:
	print(node)
	if "hit" in node:
		num_of_enemies -= 1
