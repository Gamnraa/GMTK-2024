extends Node2D

var ball_obj = preload("res://Nodes/Ball.tscn")

@onready var red_objects = [$ObstacleR, $ObstacleR2, $ObstacleR3, $ObstacleR4, $ObstacleR5]
@onready var blue_objects = [$ObstacleB1]
@onready var green_objects = []
@onready var yellow_objects = [$ObstacleY1, $ObstacleY2]

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.balls = []
	Global.balls.append($Ball)
	
	Global.red.connect(red_signal_received)
	Global.blue.connect(blue_signal_received)
	Global.green.connect(green_signal_received)
	Global.yellow.connect(yellow_signal_received)


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

func red_signal_received():
	for p in red_objects:
		p.get_node("AnimationPlayer").play("Expand")


func green_signal_received():
	for p in green_objects:
		p.get_node("AnimationPlayer").play("Expand")


func blue_signal_received():
	for p in blue_objects:
		p.get_node("AnimationPlayer").play("Expand")


func yellow_signal_received():
	for p in yellow_objects:
		p.get_node("AnimationPlayer").play("Expand")
