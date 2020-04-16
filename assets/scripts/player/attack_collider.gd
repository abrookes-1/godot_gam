extends Node

func _ready():
	get_parent().connect("area_entered", self, "_on_collision")

func _on_collision(value):
	var collider = value.get_parent()
	# user better method to determine of object is player
	print("punched ", collider.name)
