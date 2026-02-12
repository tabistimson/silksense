class_name PlayerStateMachine extends Node

var states : Array[ State ]
var prev_state : State
var current_state : State

func _ready():
	process_mode = Node.PROCESS_MODE_DISABLED #makes node disabled until initialized
	pass
	
func _process(delta):
	ChangeState(current_state.Process(delta))
	pass
	
func Initialize(_player : Player) -> void:
	states = []
	
	for c in get_children(): #for each node idle and walk
		if c is State:
			states.append(c)
		
	if states.size() > 0:
		states[0].player = _player # sets player as a trait of the states
		ChangeState( states [0])
		process_mode = Node.PROCESS_MODE_INHERIT #if player disabled, this node disabled

func ChangeState(new_state : State) -> void:
	#make sure its a valid state and not current state 
	if new_state == null || new_state == current_state:
		return
	if current_state:
		current_state.Exit()
		
	prev_state = current_state
	current_state = new_state
	current_state.Enter()
		
	
