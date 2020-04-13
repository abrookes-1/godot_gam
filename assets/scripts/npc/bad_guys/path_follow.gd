extends Path2D

onready var follower = get_node("follow")
var speed = 100

func _ready():
	pass

func _process(delta):
	follower.set_offset(follower.get_offset() + speed * delta)
