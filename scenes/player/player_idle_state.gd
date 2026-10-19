extends PlayerState
class_name PlayerIdleState

func enter_state() -> void:
	print("ENTER_STATE:IDLE")
	player.play_animation_sprite(MovementConsts.IDLE_ACTION)
	

func _input(_event: InputEvent) -> void:
	var player_is_moving: bool = player.get_player_movement() != Vector2.ZERO
	if fsm.current_state.name != StateConsts.WALK_STATE and player_is_moving:
		fsm.transition_to(StateConsts.WALK_STATE)

func exit_state() -> void:
	print("EXIT_STATE:IDLE")
