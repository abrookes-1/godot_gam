extends Node

onready var sprite = get_parent().get_parent().get_node("AnimatedSprite")
var character_direction = Vector2(0,0)

func _ready():
	get_parent().get_parent().get_node("PlayerController").connect("direction_change", self, "_on_direction_change")

func play():
#	sprite.play("walking_right")
	pass

func _on_direction_change(direction_vec):
	if direction_vec == Vector2(0,1):
		sprite.play("walking_down")
	elif direction_vec == Vector2(0,-1):
		sprite.play("walking_up")
	elif direction_vec == Vector2(1,0):
		sprite.play("walking_right")
	elif direction_vec == Vector2(-1,0):
		sprite.play("walking_left")
