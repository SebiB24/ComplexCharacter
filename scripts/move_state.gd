class_name MoveState extends StateOnGround

func _physics_update(delta: float) -> void:
    super._physics_update(delta)
    var was_facing_right = player.facing_right
    if player.direction.x > 0:
        if not was_facing_right:
            player.turn = true
        player.facing_right = true
    elif player.direction.x < 0:
        if was_facing_right:
            player.turn = true
        player.facing_right = false
    