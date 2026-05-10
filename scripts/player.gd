extends CharacterBody2D
const PLAYER_SPEED = 80.0

@export var bullet_scene: PackedScene

func _input(event):
	if event.is_action_pressed("mouse_left_click"):
		print("mouse left clicked")
		shoot()
	

func shoot():
	var bullet = bullet_scene.instantiate()
	bullet.global_position = global_position

	var mouse_pos = get_global_mouse_position()
	bullet.direction = (mouse_pos - bullet.global_position).normalized()
	bullet.destination = mouse_pos
	print('direction', bullet.direction)	
	print('destination', bullet.destination)

	get_tree().current_scene.add_child(bullet)

	
func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO

	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")

	velocity = direction.normalized() * PLAYER_SPEED 

	move_and_slide()
