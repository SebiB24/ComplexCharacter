extends Node

signal move(input_direction: Vector2)


func _process(delta: float) -> void:
	
	var input_direction = Input.get_vector("move_left", "move_right", "move_up", "move_down");
	if input_direction != Vector2.ZERO:
		move.emit(input_direction);
	else:
		move.emit(Vector2.ZERO);
