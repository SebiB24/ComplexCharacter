class_name StateIdle extends StateOnGround

func enter(pState: State) -> void:
	player.velocity = Vector2.ZERO
	player.direction = Vector2.ZERO
	if pState && pState.name == "Fall":
		sprite.play("Land")
	else:
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
	if(!player.is_on_ground):
		transitioned.emit(self, "Jump")
		return
	if player.is_crouched:
		transitioned.emit(self, "Crouch")
		return

	if sprite.is_playing() || sprite.animation == "Fall":
		return
	sprite.play("Idle")
