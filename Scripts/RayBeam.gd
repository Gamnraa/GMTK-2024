extends CharacterBody2D


var speed = 200.0
var angle = 0

@export var color: int = 0


func _ready():
	if color not in range(4): color = 0
	$Sprite.material.set_shader_parameter("color", color)
	rotate(angle)
	$Sprite/AnimationPlayer.play("Spawn")
	
	if color == 0: Global.red.connect(_on_color_signal)
	if color == 1: Global.green.connect(_on_color_signal)
	if color == 2: Global.blue.connect(_on_color_signal)
	if color == 3: Global.yellow.connect(_on_color_signal)

func _physics_process(delta):
	velocity = Vector2(speed, speed * angle)
	move_and_slide()


func _on_area_2d_body_entered(body):
	if body is RigidBody2D and body.get_node("SizeCooldown").is_stopped(): 
		if color == 0 and body.size < 4: body.new_size += 1
		if color == 3 and body.size > 0: body.new.size -= 1

func _on_color_signal():
	$AnimationPlayer.play("Expand")

func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Expand": $AnimationPlayer.play("Shrink")


func _on_timer_timeout():
	queue_free()
