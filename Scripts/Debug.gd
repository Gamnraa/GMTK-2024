extends Node2D

var ball_obj = preload("res://Nodes/Ball.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	Global.balls = []
	Global.balls.append($Ball)
	print(Global.balls)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	#if Input.is_action_just_pressed("key_w"): $Obstacle2.get_node("AnimationPlayer").play("Expand")
	
func new_ball():

	var ball = ball_obj.instantiate()
	ball.position = Vector2(1213, 565)
	Global.balls.append(ball)
	add_child(ball)


func _on_area_2d_body_entered(body):
	if body is RigidBody2D:
		Global.balls_active -= 1
		Global.balls.erase(body)
		body.queue_free()
		new_ball()
