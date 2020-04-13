extends Node


var states_stack = []
var starting_state = "Idle"

# Called when the node enters the scene tree for the first time.
func _ready():
	states_stack.push_front(get_node("Idle"))
	states_stack[0].play()
	
func getState():
	return states_stack[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
