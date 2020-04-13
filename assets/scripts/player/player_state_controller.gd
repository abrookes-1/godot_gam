extends "res://assets/scripts/state_machine/state_machine.gd"


onready var state_map = {
	"Idle": $Idle,
	"Jumping": $Jumping,
}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _input(event):
	# start jump animation
	if Input.is_action_just_pressed("player_jump"):
		_push_state(state_map["Jumping"])
		
func _process(delta):
	var idle = false
	if getState() == state_map["Idle"]:
		idle = true
	

