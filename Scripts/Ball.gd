extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _integrate_forces(state):
	#print(state.get_velocity_at_local_position(position))
	for body in get_colliding_bodies():
		var anim = body.get_node("AnimationPlayer")
		if is_instance_valid(anim) and anim.is_playing() and anim.current_animation == "Expand":
			apply_impulse(2 * state.get_velocity_at_local_position(position))

func launch(force):
	freeze = false
	print(force)
	apply_impulse(force)
	Global.is_waiting_for_ball = false
	Global.balls_active = 1


func _on_body_entered(body):
	print(body)
