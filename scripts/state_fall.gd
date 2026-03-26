class_name StateFall extends StateOffGround

func enter(pState: State) -> void:
	sprite.play("Fall")

func update(delta: float) -> void:
	super(delta)
	if player.is_on_ground:
		transitioned.emit(self, "Idle")
		return