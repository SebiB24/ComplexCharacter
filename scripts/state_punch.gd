class_name StatePunch extends PlayerState

func enter(pState: State) -> void:
    player.velocity = Vector2.ZERO
    player.direction = Vector2.ZERO
    sprite.play("attack_1")

func update(detla: float) -> void:
    if !sprite.is_playing():
        revert.emit(self)
        return

func exit() -> void:
    player.is_punching = false