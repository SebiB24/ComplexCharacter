class_name StateRun extends MoveState

func enter(pState: State) -> void:
    player.speed = 450.0
    sprite.play("Run")

func update(delta: float) -> void:
    super(delta)
    
    if(!player.is_running):
        revert.emit(self)
        return

    if(!player.is_on_ground):
        transitioned.emit(self, "Jump")
        return