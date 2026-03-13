class_name StateJump extends StateOffGround

func enter(state: State) -> void:
	sprite.play("Jump")
	player.direction.y = 0.0
	player.jump_velocity = Player.JUMP_VELOCITY
	player.base_level = player.global_position.y

func update(delta: float) -> void:
	if player.is_on_ground:
		transitioned.emit(self, "Idle")
		return

func _physics_update(delta: float) -> void:
	super(delta);
	player.velocity = player.direction * player.SPEED
	player.velocity.y += player.jump_velocity 
	player.jump_velocity += Player.GRAVITY * delta

	# stop jump
	if player.global_position.y >= player.base_level and player.jump_velocity > 0.0:
		player.is_on_ground = true
		player.jump_velocity = 0.0
		player.velocity.y = 0.0
		player.global_position.y = player.base_level
