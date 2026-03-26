class_name StateJump extends StateOffGround

func enter(pState: State) -> void:
	sprite.play("Jump")
	player.direction.y = 0.0
	player.jump_velocity = Player.JUMP_VELOCITY
	player.base_level = player.global_position.y

func update(delta: float) -> void:
	super(delta)
	if player.is_on_ground:
		transitioned.emit(self, "Idle")
		return

	if player.jump_velocity > 0.0:
		transitioned.emit(self, "Fall")
		return
