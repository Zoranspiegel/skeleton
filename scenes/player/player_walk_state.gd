extends PlayerState
class_name PlayerWalkState

func enter_state() -> void:
	print("ENTER_STATE:WALK")

func process_state(_delta: float) -> void:
	if player.get_player_movement() != Vector2.ZERO:
		player.play_animation_sprite(MovementConsts.WALK_ACTION)
		player.velocity = player.get_player_movement() * player.move_speed
		player.move_and_slide()
	else:
		fsm.transition_to(StateConsts.IDLE_STATE)

func exit_state() -> void:
	print("EXIT_STATE:WALK")
