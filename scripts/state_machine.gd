class_name StateMachine extends Node

@export var initial_state: State

var state_stack: Array[State] = []
var states: Dictionary = {}

func _ready() -> void:
    for child in get_children():
        if child is State:
            states[child.name.to_lower()] = child
            child.transitioned.connect(_on_child_transitioned)
            child.revert.connect(_on_revert_to_last)
    if initial_state:
        initial_state.enter(null)
        state_stack.append(initial_state)


func _process(delta: float) -> void:
    if state_stack:
        state_stack[-1].update(delta)

func _physics_process(delta: float) -> void:
    if state_stack:
        state_stack[-1]._physics_update(delta)

func _on_child_transitioned(state: State, new_state_name: String) -> void:
    var current_state = state_stack[-1]
    if state != current_state:
        return

    var new_state = states.get(new_state_name.to_lower())
    if not new_state:
        return

    if state_stack:
        current_state.exit()

    new_state.enter(current_state)
    state_stack.append(new_state)

    if state_stack.size() > 2:
        state_stack.pop_front()

func _on_revert_to_last(state: State) -> void:
    if state != state_stack[-1]:
        return
    if state_stack.size() < 2:
        return
    var old_state = state_stack.pop_back()
    old_state.exit()
    state_stack[-1].enter(old_state)