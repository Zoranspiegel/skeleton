extends PlayerState
class_name PlayerIdleState

func enter_state() -> void:
	print("ENTER_STATE:IDLE")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("dev"):
		fsm.transition_to("WalkState")

func exit_state() -> void:
	print("EXIT_STATE:IDLE")
