extends Node

signal move(input_direction: Vector2)
signal jump()


func _process(delta: float) -> void:

	# Movement
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down");
	if input_direction != Vector2.ZERO:
		move.emit(input_direction);
	else:
		move.emit(Vector2.ZERO);
		
	# Jumping
	if Input.is_action_just_pressed("jump"):
		jump.emit()
