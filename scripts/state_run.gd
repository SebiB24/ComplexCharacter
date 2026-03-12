class_name StateRun extends MoveState

func enter() -> void:
	sprite.play("Run")
	
func update(delta: float) -> void:
	super(delta)
	# don't want to stop the entire program untill animation is done.
	# We just don't want the rest of the code in the function to execute.
	if sprite.animation == "Turn" and sprite.is_playing():
		return

	if player.turn:
		sprite.play("Turn")
		player.turn = false
		return

	if player.input_direction == Vector2.ZERO:
		transitioned.emit(self, "Idle")
		return

	if player.is_crouched:
		transitioned.emit(self, "Crouch")
		return

	sprite.flip_h = not player.facing_right
	sprite.play("Run")

func _physics_update(delta: float) -> void:
	super(delta)