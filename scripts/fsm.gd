extends Node
class_name FSM

@export var initial_state: State

var current_state: State

func _ready() -> void:
	await owner.ready
	for state: State in get_children():
		state.fsm = self
	
	current_state = initial_state
	current_state.enter_state()

func transition_to(state_name: String) -> void:
	var new_state = get_node(state_name)
	if new_state is State:
		current_state.exit_state()
		current_state = new_state
		current_state.enter_state()
