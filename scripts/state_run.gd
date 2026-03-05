class_name StateRun extends StateOnGround

func enter() -> void:
	player.get_node("AnimatedSprite2D").play("Run")
	
func update(delta: float) -> void:
	super.update(delta)
	if player.input_direction == Vector2.ZERO:
		transitioned.emit(self, "Idle")

func _physics_process(delta: float) -> void:
	player.direction = player.input_direction.normalized()
