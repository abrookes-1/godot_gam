extends "res://assets/scripts/state_machine/state_machine.gd"


onready var state_map = {
	"Idle": $Idle,
	"Jumping": $Jumping,
	"Walking": $Walking,
}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	# start jump animation
	if Input.is_action_just_pressed("player_jump"):
		_push_state(state_map["Jumping"])
		
func _process(delta):
#	var idle = false
#	if getState() == state_map["Idle"]:
#		idle = true
	var walking_attempt = [
		Input.is_action_pressed("player_up"),
		Input.is_action_pressed("player_down"),
		Input.is_action_pressed("player_left"),
		Input.is_action_pressed("player_right")
	].max()

	# TODO: probably a better way of starting walking animation
	if (getState() == state_map["Idle"]):		
		if walking_attempt:
			_push_state(state_map["Walking"])
	elif (getState() == state_map["Walking"]):
		if !walking_attempt:
			_end_state()
		
	
#	if !walking && (getState() == state_map["Walking"]):
#		_replace_state(state_map[""])
	

