class_name StateCrouched extends MoveState

func enter(pState: State) -> void:
	player.speed = 150.0

func update(delta: float) -> void:
	# crouch should not have to check these atributes, this is proof of bad architecture 
	# this issue would be fixed with the controller + command pattern future implementation
	if not player.is_on_ground:
		player.is_on_ground = true

	if player.is_punching:
		player.is_punching = false

	if !player.is_crouched:
		revert.emit(self)
		return

	if player.velocity != Vector2.ZERO:
		sprite.play("Crouch_walk")
	else:
		sprite.play("Crouch_idle")
	
	
