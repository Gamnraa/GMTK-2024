extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func launch(force):
	freeze = false
	print(force)
	apply_impulse(force)
	Global.is_waiting_for_ball = false
