extends AnimatableBody2D
#0 = red, 1 = green, 2 = blue, 3 = yellow
@export var color: int


# Called when the node enters the scene tree for the first time.
func _ready():
	if color not in range(4): color = 0
	$Sprite.material.set_shader_parameter("color", color)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
