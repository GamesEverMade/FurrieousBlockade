extends Node
class_name state_machine
## State Machine
## Manages different states in a scene.
## 
## It automatically registers childs nodes that extends the State Class
## It allows transitions between those states and ensures that only one state is active at the time.

var current_state : State
var states: Dictionary = {}

func _ready() -> void:
	"""
	Initializes the state machine by registering all child nodes that are intances of 'State'
	Connects the 'Transition' signal from each state to handle state transitions
	If initial state is set, it enters that state.
	"""
	
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.state_finished.connect(_on_state_finished)
	
	if !states.is_empty():
		current_state = states.values()[0]
		current_state.enter()

func _physics_process(delta: float) -> void:
	"""
	Calls the 'Update' Function of the current state every frame.
	@param delta: The time elapsed since the last frame.
	"""
	if current_state:
		current_state.update(delta)
	
	#print(current_state)

func transition_to(state_name: String) -> void:
	"""
	Calls the 'exit' Function to get out of the current state, and call the 'enter' 
	Function to enter in the next state.
	@param state_name: The name of the state to be transitioned to.
	"""
	if current_state:
		current_state.exit()
	current_state = states[state_name.to_lower()]
	current_state.enter()

func _on_state_finished(next_state: String) -> void:
	"""
	Calls the 'Transition To' Function in order to go to the next state.
	@param next_state: The next state to be loaded.
	"""
	transition_to(next_state)
