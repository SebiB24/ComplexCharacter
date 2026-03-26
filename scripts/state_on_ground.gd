class_name StateOnGround extends PlayerState

func update(delta: float) -> void:
    if player.is_punching:
        transitioned.emit(self, "Punch")