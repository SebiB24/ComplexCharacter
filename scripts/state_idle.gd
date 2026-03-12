class_name StateIdle extends StateOnGround

func enter() -> void:
	player.direction = Vector2.ZERO
	player.get_node("AnimatedSprite2D").play("Idle")
	if player.facing_right:
		player.get_node("AnimatedSprite2D").flip_h = false
	else:
		player.get_node("AnimatedSprite2D").flip_h = true

func update(delta: float) -> void:
	super.update(delta)
	if player.input_direction != Vector2.ZERO:
		transitioned.emit(self, "Run")
		return
	if player.is_crouched:
		transitioned.emit(self, "Crouch")
