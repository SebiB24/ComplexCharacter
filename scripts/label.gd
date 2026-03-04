extends Label

@onready var player: Player = owner.get_child(0)

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	text = "State: " + player.get_node("StateMachine").current_state.name
