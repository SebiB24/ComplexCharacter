class_name StateJump extends PlayerState

func enter() -> void:
    player.get_node("AnimatedSprite2D").play("Jump")
    player.jump_velocity = Player.JUMP_VELOCITY
    player.base_level = player.global_position.y

func update(delta: float) -> void:
    player.input_direction.y = 0.0;
    if player.is_on_ground:
        transitioned.emit(self, "Idle")

func _physics_update(delta: float) -> void:
    player.velocity = player.direction * player.SPEED
    player.velocity.y += player.jump_velocity 
    player.jump_velocity += Player.GRAVITY * delta
    if player.global_position.y >= player.base_level and player.jump_velocity > 0.0:
        player.is_on_ground = true
        player.jump_velocity = 0.0
        player.velocity.y = 0.0
        player.global_position.y = player.base_level