class_name MoveState extends StateOnGround

func _physics_update(delta: float) -> void:
    super._physics_update(delta)
    if player.direction.x > 0:
        player.facing_right = true
    elif player.direction.x < 0:
        player.facing_right = false
    