class_name StateMachine extends Node

@export var initial_state: State
var current_state: State
var states: Dictionary = {}

func _ready() -> void:
    for child in get_children():
        if child is State:
            states[child.name.to_lower()] = child
            child.transitioned.connect(_on_child_transitioned)
    if initial_state:
        initial_state.enter()
        current_state = initial_state


# Call every frame functions (the way the current state can continuasly affect the player)
func _process(delta: float) -> void:
    if current_state:
        current_state.update(delta)

func _physics_process(delta: float) -> void:
    if current_state:
        current_state._physics_update(delta)

func _on_child_transitioned(state: State, new_state_name: String) -> void:
    if state != current_state:
        return

    var new_state = states.get(new_state_name.to_lower())
    if not new_state:
        return

    if current_state:
        current_state.exit()

    new_state.enter()
    current_state = new_state