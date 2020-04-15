extends Node

onready var sprite = get_parent().get_parent().get_node("AnimatedSprite")

func play():
	sprite.play("idle")
	#get_node("../../AnimatedSprite").play("idle")
	pass
