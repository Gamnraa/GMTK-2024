extends Node2D
var ball_obj = preload("res://Nodes/Ball.tscn")

@onready var red_objects = []
@onready var green_objects = [$Obstacle, $Obstacle2, $Obstacle3]
@onready var blue_objects = [$Frog]
@onready var yellow_objects = [$Clock/Pendulum]

# Called when the node enters the scene tree for the first time.
func _ready():
	$Frog.get_node("ColorRect").rotation = -13
	$Frog.get_node("CollisionShape2D").rotation = -13
	
	Global.balls = []
	Global.balls.append($Ball)
	Global.scene = self
	
	Global.red.connect(red_signal_received)
	Global.blue.connect(blue_signal_received)
	Global.green.connect(green_signal_received)
	Global.yellow.connect(yellow_signal_received)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$Score/Amt.text = str(Global.score)
	$Balls/Amt.text = str(Global.balls_left)
	$Space.visible = Global.is_waiting_for_ball
	

func new_ball():
	var ball = ball_obj.instantiate()
	ball.position = Vector2(2119, 654)
	Global.balls.append(ball)
	call_deferred("add_child", ball)


func _on_ball_kill_body_entered(body):
	if body is RigidBody2D:
		Global.balls_active -= 1
		Global.balls.erase(body)
		body.queue_free()
		if Global.balls_active <= 0:
			new_ball()


func _on_fail_zone_body_entered(body):
	if body is RigidBody2D: Global.is_waiting_for_ball = true
	
	
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
