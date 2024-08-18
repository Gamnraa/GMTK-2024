extends AnimatableBody2D

@onready var beam = preload("res://Nodes/RayBeam.tscn")

var modes = [0, 2] #grow, shrink
var sprites = ["raygun-grow.png", "raygun_shrink.png"]
var mode = 1
@export var direction = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is RigidBody2D:
		mode = wrapi(mode + 1, 0, 1)
		$Sprite.texture = load("res://Sprites/" + sprites[mode])
		$DisableTimer.start()
		$BeamTimer.start()


func _on_disable_timer_timeout():
	$BeamTimer.stop()


func _on_beam_timer_timeout():
	var b = beam.instantiate()
	b.position = position + $Sprite/BeamSpawnPoint.position
	b.color = modes[mode]
	b.angle = rotation
	b.speed *= direction
	Global.scene.add_child(b)
