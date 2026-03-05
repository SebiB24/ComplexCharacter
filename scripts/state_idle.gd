class_name StateIdle extends StateOnGround

func enter() -> void:
	player.get_node("AnimatedSprite2D").play("Idle")

func update(delta: float) -> void:
	super.update(delta)
	if player.input_direction != Vector2.ZERO:
		transitioned.emit(self, "Run")
