extends Node
signal walking

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var p = get_parent()
var speed = 300


func _ready():
	# TODO: move to settings script or something
	get_viewport().set_size_override_stretch(true)

func _process(delta):
	var deltap = Vector2(0,0)
	
	if Input.is_action_pressed("player_up"):
		deltap.y -= 1
	if Input.is_action_pressed("player_down"):
		deltap.y += 1
	if Input.is_action_pressed("player_left"):
		deltap.x -= 1
	if Input.is_action_pressed("player_right"):
		deltap.x += 1
		
	if deltap.length() != 0:
		# normalize vector
		deltap = deltap / deltap.length()
		# multiply by speed and delta time
		deltap = deltap * speed * delta
		p.global_translate(deltap)

func kill():
	print("you ded")
