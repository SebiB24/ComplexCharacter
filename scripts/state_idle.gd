class_name StateIdle extends StateOnGround

func enter(state: State) -> void:
	player.direction = Vector2.ZERO
	sprite.play("Idle")
	if player.facing_right:
		sprite.flip_h = false
	else:
		sprite.flip_h = true

func update(delta: float) -> void:
	super.update(delta)
	if player.input_direction != Vector2.ZERO:
		transitioned.emit(self, "Walk")
		return
	if player.is_crouched:
		transitioned.emit(self, "Crouch")
