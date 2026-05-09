extends CharacterBody2D

const SPEED = 100.0

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO

	direction.x = Input.get_axis("move_left", "move_right")
	direction.y = Input.get_axis("move_up", "move_down")

	velocity = direction.normalized() * SPEED 

	move_and_slide()
