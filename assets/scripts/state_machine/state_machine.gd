extends Node


var states_stack = []
var starting_state = "Idle"
onready var melee_sprite = get_node("../AnimatedSprite")


# Called when the node enters the scene tree for the first time.
func _ready():
	melee_sprite.connect("animation_finished", self, "_on_anim_finish")
	states_stack.push_front(get_node("Idle"))
	getState().play()
	
func getState():
	return states_stack[0]
	
func _on_anim_finish():
	_end_state()

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
