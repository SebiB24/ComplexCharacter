extends Label

@onready var player: Player = owner.get_child(0) as Player

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	text = "State: " + player.get_node("StateMachine").current_state.name
	text += "\nFacing Right: " + str(player.facing_right)
	text += "\nCrouched: " + str(player.is_crouched)
