class_name StateOnGround extends State

@onready var player: Player = owner

func update(delta: float) -> void:
    if not player.is_on_ground:
        transitioned.emit(self, "Jump")

func _physics_update(delta: float) -> void:
    player.velocity = player.direction * player.SPEED

