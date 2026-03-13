class_name StateCrouched extends MoveState

func enter(pState: State) -> void:
	player.speed = 150.0
	if pState.name == "Idle":
		sprite.play("Crouch_enter")

func update(delta: float) -> void:
	if !player.is_crouched:
		revert.emit(self)
		return

	if sprite.animation == "Crouch_enter" and sprite.is_playing():
		return
	
	if player.velocity != Vector2.ZERO:
		sprite.play("Crouch_walk")
	else:
		sprite.play("Crouch_idle")

	sprite.flip_h = not player.facing_right

	
	
