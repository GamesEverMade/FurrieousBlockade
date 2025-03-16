extends Node
class_name State

## Class : State 
## Defines the States availiable for the State machine.
## 
## It defines the necessary methods for the state machine properly work.
## The methods are used to execute the transitions between each node/state.

## VARIABLES
var player: CharacterBody2D

"""
Signal:
	It emit the necessary signal declaring that the current state has been finished.
"""
signal state_finished(next_state: String)

# METHODS
"""
Enter:
Executed as soon as the state initiates, It runs the current method. Only runs once.
"""
func enter():
	pass

"""
Exit:
Calls the ending of the current state. Executed only onced.
"""
func exit():
	pass

"""
Update:
It Keeps been called every frame and refresh the current state.	
@param delta: The time elapsed since the last frame. 
"""
func update(_delta):
	pass

"""
Handle_input:
Handles the input/command in order to change the states.
@param delta: The time elapsed since the last frame. 
"""
func handle_input(_delta):
	pass
