class_name Player extends CharacterBody2D


@onready var input_handler = $InputHandler

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
const GRAVITY = 900.0

var input_direction: Vector2 = Vector2.ZERO
var is_on_ground: bool = true
var facing_right: bool = true
var turn: bool = false

var direction: Vector2 = Vector2.ZERO
var jump_velocity: float = 0.0
var base_level: float = 0.0


func _ready() -> void:
	input_handler.move.connect(_on_input_move)
	input_handler.jump.connect(_on_input_jump)

func _on_input_move(dir: Vector2) -> void:
	input_direction = dir

func _on_input_jump() -> void:
	is_on_ground = false
	
func _physics_process(delta: float) -> void:
	move_and_slide()
