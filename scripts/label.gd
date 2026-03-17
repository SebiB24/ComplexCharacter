extends Label

@onready var player: Player = owner.get_child(0) as Player

func _ready() -> void:
	pass


func _process(delta: float) -> void:
	var state = "Error"
	var state_stack = player.get_node("StateMachine").state_stack
	if state_stack:
		state = state_stack[-1].name
	text = "State: " + state
	text += "\nOn Ground: " + str(player.is_on_ground) 
	text += "\nFacing Right: " + str(player.facing_right)
	text += "\nCrouched: " + str(player.is_crouched)
	text += "\nRunning: " + str(player.is_running)
	text += '\nTurn: ' + str(player.turn)
