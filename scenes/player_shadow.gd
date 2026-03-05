extends Node2D

@onready var knight: Knight = owner.get_node("Knight")

func _process(delta: float) -> void:
	position.x = knight.get_node("ShadowAnchor").global_position.x
	if knight.is_on_ground:
		position.y = knight.get_node("ShadowAnchor").global_position.y
