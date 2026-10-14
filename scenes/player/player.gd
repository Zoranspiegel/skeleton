extends CharacterBody2D
class_name Player

@export_group("Stats")
@export var move_speed: float = 60.0

@onready var fsm: FSM = $FSM
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

var last_direction: String = "down"

func _process(delta: float) -> void:
	if fsm.current_state:
		fsm.current_state.process_state(delta)

func get_player_movement() -> Vector2:
	var direction: Vector2 = Input.get_vector("move_left","move_right","move_up","move_down")
	
	if direction != Vector2.ZERO:
		update_last_direction(direction)
		
	return direction

func update_last_direction(input_vector: Vector2) -> void:
	if abs(input_vector.x) > abs(input_vector.y):
		last_direction = MovementConsts.LEFT if input_vector.x < 0 else MovementConsts.RIGHT
	else:
		last_direction = MovementConsts.UP if input_vector.y < 0 else MovementConsts.DOWN

func play_animation_sprite(action: String) -> void:
	animated_sprite.play("%s_%s" % [action, last_direction])
