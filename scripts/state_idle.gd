class_name StateIdle extends State

@onready var player: Player = owner

func enter() -> void:
	player.get_node("AnimatedSprite2D").play("Idle")

func update(delta: float) -> void:
	if player.input_direction != Vector2.ZERO:
		transitioned.emit(self, "Run")
