#Blueprint for future states 
class_name State_Walk extends State

@export var speed : float = 200.0
@onready var idle: State = $"../idle"

## what happens when the player enters this state
func Enter() -> void:
	player.update_animation("walk")
	pass
	
func Exit() -> void:
	pass
	
#returning a state eg can change into walk state 
func Process(_delta : float) -> State:
	if player.direction == Vector2.ZERO:
		return idle
	
	player.velocity = player.direction * speed
	
	if player.set_direction():
		player.update_animation("walk")
	return null
	
func Physics(_delta :float) -> State:
	return null
	
func HandleInput(_event: InputEvent )-> State:
	return null 
