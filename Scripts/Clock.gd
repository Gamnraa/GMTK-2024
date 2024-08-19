extends AnimatableBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is RigidBody2D:
		Global.pendulum_speed.emit(randi_range(1, 12) + randf_range(0.00, 0.59))
