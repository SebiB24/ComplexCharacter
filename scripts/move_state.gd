class_name MoveState extends PlayerState

func _physics_update(delta: float) -> void:
    player.velocity = player.direction * player.speed

    player.turn = false
    var was_facing_right = player.facing_right
    if player.direction.x > 0:
        if not was_facing_right:
            player.turn = true
        player.facing_right = true
    elif player.direction.x < 0:
        if was_facing_right:
            player.turn = true
        player.facing_right = false

    sprite.flip_h = not player.facing_right

    player.direction = player.input_direction.normalized()
