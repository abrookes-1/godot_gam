extends Node


var states_stack = []
var starting_state = "Idle"
onready var anim_player = get_node("../AnimationPlayer")


# Called when the node enters the scene tree for the first time.
func _ready():
	anim_player.connect("animation_finished", self, "on_anim_finish")
	states_stack.push_front(get_node("Idle"))
	getState().play()
	
func getState():
	return states_stack[0]
	
func on_anim_finish(anim_name):
	states_stack.pop_front()
	getState().play()

func _replace_state(state):
	var current = states_stack.pop_front()
	_push_state(state)

func _push_state(state):
	states_stack.push_front(state)
	getState().play()

func _end_state():
	# removes the current state from the stack and plays the next
	if len(states_stack) > 1:
		states_stack.pop_front()
		getState().play()
