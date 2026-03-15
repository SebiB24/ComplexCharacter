class_name StateCrouched extends MoveState

func enter(pState: State) -> void:
	player.speed = 150.0

func update(delta: float) -> void:
	if !player.is_crouched:
		revert.emit(self)
		return

	if player.velocity != Vector2.ZERO:
		sprite.play("Crouch_walk")
	else:
		sprite.play("Crouch_idle")

	sprite.flip_h = not player.facing_right

	
	
