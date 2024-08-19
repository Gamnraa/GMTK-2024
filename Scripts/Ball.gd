extends RigidBody2D

var size = 2
var new_size = 2

var sizes = [ #Mass, Gravity Scale, Scale
	[3, 1.34, .25],
	[6, 1.22, .34],
	[12, 1.15, .44],
	[24, .98, .56],
	[48, .85, .75]
]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _integrate_forces(state):
	if new_size != size: change_size()
	#print(state.get_velocity_at_local_position(position))
	for body in get_colliding_bodies():
		
		var anim = body.get_node_or_null("AnimationPlayer")
		var swing = body.get_node_or_null("Swing")
		var force = 2
		if is_instance_valid(swing) and anim.is_playing(): apply_impulse(2 * state.get_velocity_at_local_position(position))
		if is_instance_valid(anim) and anim.is_playing() and anim.current_animation == "Expand":
			apply_impulse(3 * state.get_velocity_at_local_position(position))

func launch(force):
	freeze = false
	print(force)
	apply_impulse(force)
	Global.is_waiting_for_ball = false
	Global.balls_active = 1

func change_size():
	print(new_size)
	mass = sizes[new_size][0]
	gravity_scale = sizes[new_size][1]
	$Sprite.scale = Vector2(sizes[new_size][2], sizes[new_size][2])
	$CollisionShape2D.scale = Vector2(sizes[new_size][2] / 2, sizes[new_size][2] / 2)
	size = new_size
	$SizeCooldown.start()


func _on_body_entered(body):
	pass
