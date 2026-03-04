class_name Player extends CharacterBody2D


@onready var input_handler = $InputHandler

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var input_direction: Vector2 = Vector2.ZERO
var direction: Vector2 = Vector2.ZERO

func _ready() -> void:
	input_handler.move.connect(_on_input_move)

func _on_input_move(dir: Vector2) -> void:
	input_direction = dir

func _physics_process(delta: float) -> void:


	velocity = direction * SPEED


	move_and_slide()
