extends Node

onready var sprite = get_parent().get_parent().get_node("MeleeSprite")
var character_direction = Vector2(0,0)

func _ready():
	get_parent().get_parent().get_node("PlayerController").connect("direction_change", self, "_on_direction_change")
	get_parent().get_parent().get_node("PlayerController").connect("attack", self, "_on_attack")
	get_parent().get_parent().get_node("MeleeSprite").connect("animation_finished", self, "_on_attack_complete")
	
func play():
	# TODO fix for directions between cardinal
	pass

func _on_direction_change(d):
	# keeps an up to date copy of character direction
	character_direction = d

func _on_attack(type, vec):
#	if character_direction == Vector2(0,1):
#		sprite.play("melee_down")
#	elif character_direction == Vector2(0,-1):
#		sprite.play("melee_up")
#	elif character_direction == Vector2(1,0):
#		sprite.play("melee_right")
#	elif character_direction == Vector2(-1,0):
#		sprite.play("melee_left")
	sprite.global_position = vec + get_parent().get_parent().get_node("PlayerController").global_position
	sprite.show()
	sprite.play("melee_right")

func _on_attack_complete():
	sprite.hide()
	sprite.play("default")
