class_name StateRun extends MoveState

func enter() -> void:
	player.get_node("AnimatedSprite2D").play("Run")
	
func update(delta: float) -> void:
	super.update(delta)
	if player.input_direction == Vector2.ZERO:
		transitioned.emit(self, "Idle")
	if player.facing_right:
		player.get_node("AnimatedSprite2D").flip_h = false
	else:
		player.get_node("AnimatedSprite2D").flip_h = true

func _physics_update(delta: float) -> void:
	super._physics_update(delta)
	player.direction = player.input_direction.normalized()
