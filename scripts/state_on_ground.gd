class_name StateOnGround extends PlayerState

func update(delta: float) -> void:
    if not player.is_on_ground:
        transitioned.emit(self, "Jump")
    if player.is_crouched:
        transitioned.emit(self, "Crouch")

func _physics_update(delta: float) -> void:
    player.velocity = player.direction * player.SPEED

