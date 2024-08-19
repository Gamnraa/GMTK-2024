extends RigidBody2D

var size = 2
var new_size = 2

var sizes = [ #Mass, Gravity Scale, Scale
	[3, 1.34, .5],
	[6, 1.22, .75],
	[12, 1.15, 1],
	[24, .98, 1.34],
	[48, .85, 2.00]
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
		var anim = body.get_node("AnimationPlayer")
		if is_instance_valid(anim) and anim.is_playing() and anim.current_animation == "Expand":
			apply_impulse(2 * state.get_velocity_at_local_position(position))

func launch(force):
	freeze = false
	print(force)
	apply_impulse(force)
	Global.is_waiting_for_ball = false
	Global.balls_active = 1

func change_size():
	mass = sizes[new_size][0]
	gravity_scale = sizes[new_size][1]
	$Sprite.scale = Vector2(sizes[new_size][2], sizes[new_size][2])
	$CollisionShape2D.scale = Vector2(sizes[new_size][2], sizes[new_size][2])
	size = new_size
	$SizeCooldown.start()


func _on_body_entered(body):
	pass
