class_name StateWalk extends MoveState

func enter(pState: State) -> void:
	sprite.play("Walk")
	player.speed = 300.0
	
func update(delta: float) -> void:
	super(delta)

	if player.input_direction == Vector2.ZERO:
		transitioned.emit(self, "Idle")
		return

	if player.is_crouched:
		transitioned.emit(self, "Crouch")
		return

	if player.is_running:
		transitioned.emit(self, "Run")
		return

	if(!player.is_on_ground):
		transitioned.emit(self, "Jump")
		return

	
	
	# UNCOMMENT FOR TURN ANIMATION IMPLEMENTATION
	# # don't want to stop the entire program untill animation is done.
	# # We just don't want the rest of the code in the function to execute.
	# if sprite.animation == "Turn" and sprite.is_playing():
	# 	return

	# if player.turn:
	# 	sprite.play("Turn")
	# 	player.turn = false
	# 	return

