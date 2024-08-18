extends CharacterBody2D


var speed = 200.0
var angle = 0

@export var color: int = 0


func _ready():
	if color not in range(4): color = 0
	$Sprite.material.set_shader_parameter("color", color)
	rotate(angle)

func _physics_process(delta):
	print(angle)
	velocity = Vector2(speed, speed * angle)
	move_and_slide()
