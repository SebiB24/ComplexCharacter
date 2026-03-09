class_name StateOffGround extends PlayerState


func _physics_update(delta: float) -> void:
    
    # check if player is falling
    if player.jump_velocity > 0.0:
        sprite.play("Fall")