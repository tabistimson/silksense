#Blueprint for future states 

class_name State extends Node

# shared among all states 
static var player: Player

## what happens when the player enters this state
func Enter() -> void:
	pass
	
func Exit() -> void:
	pass
	
#returning a state eg can change into walk state 
func Process(_delta : float) -> State:
	return null
	
func Physics(_delta :float) -> State:
	return null
	
func HandleInput(_event: float )-> State:
	return null 
