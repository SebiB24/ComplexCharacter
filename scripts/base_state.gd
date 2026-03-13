class_name State extends Node

signal transitioned(state, new_state_name)
signal revert(state)

func enter(pState: State) -> void:
    pass

func exit() -> void:
    pass

func update(delta: float) -> void:
    pass

func _physics_update(delta: float) -> void:
    pass