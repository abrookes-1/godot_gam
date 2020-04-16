extends Node2D
signal direction_change(direction)
signal attack(type)

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var p = get_parent()
var speed = 300
var last_direction = Vector2(0,0)
var mouse_local = Vector2.ZERO
var melee_range = 60.0
var movement_disabled = false

func _ready():
	# TODO: move to settings script or something
	get_viewport().set_size_override_stretch(true)

func _input(delta):
	mouse_local = get_local_mouse_position()

func _process(delta):
	if !movement_disabled:
		handle_movement(delta)
	handle_attack()
		


func kill():
	print("you ded")

func attack(type, vec):
	# type = 0 : melee
	if vec.length() > melee_range:
		vec = vec * (melee_range/vec.length())
	emit_signal("attack", type, vec)
	print("wack", vec, vec.length())

func handle_attack():
	# attack
	if Input.is_action_just_pressed("attack"):
		# melee
		var attack_vector = mouse_local
		attack("melee", attack_vector)

func handle_movement(delta):
	# check for movement keys and move player
	var deltap = Vector2(0,0)
	var final_dp
	
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
		final_dp = deltap * speed * delta
		p.global_translate(final_dp)

	# emit movement signal if direction changes
	if deltap != last_direction:
		emit_signal("direction_change", deltap)
		last_direction = deltap
