class_name StateOffGround extends PlayerState

func _physics_update(delta: float) -> void: 
	player.velocity = player.direction * player.speed
	player.velocity.y += player.jump_velocity 
	player.jump_velocity += Player.GRAVITY * delta

	# land on ground
	if player.global_position.y >= player.base_level and player.jump_velocity > 0.0:
		player.is_on_ground = true
		player.jump_velocity = 0.0
		player.velocity.y = 0.0
		player.global_position.y = player.base_level
    