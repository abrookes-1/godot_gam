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

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):

func _input(event):
	# TODO: move this to player movement script later
	if Input.is_action_just_pressed("player_jump"):
		states_stack.push_front(get_node("Jumping"))
		getState().play()
