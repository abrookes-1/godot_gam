extends Node

onready var sprite = get_parent().get_parent().get_node("AnimatedSprite")

func play():
	sprite.play("walking")
#	get_node("../../AnimatedSprite").play("walking")
	pass
