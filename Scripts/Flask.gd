extends AnimatableBody2D
var state = 0 #empty, filled, broken
var ball_size = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	if state == 1:
		$BreakBox.monitoring = true
		$Area2D.monitoring = false
	if state == 2:
		$CollisionShape2D.disabled = true
		$BreakBox.monitoring = false
		$Sprite.texture = load("res://Sprites/vial_broken-256.png")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is RigidBody2D:
		ball_size = body.size
		state = 1
		Global.balls.erase(body)
		body.queue_free()
		Global.scene.new_ball()
		$BreakBox.monitoring = true
		$Area2D.set_deferred("monitoring", false)
		


func _on_break_box_body_entered(body):
	if body is RigidBody2D and state == 1:
		state = 2
		$CollisionShape2D.set_deferred("disabled", true)
		$BreakBox.set_deferred("monitoring", false)
		$Sprite.texture = load("res://Sprites/vial_broken-256.png")
		$CollisionShape2D2.disabled = true
		$CollisionShape2D3.disabled = true
		for i in range(3):
			var ball = Global.scene.ball_obj.instantiate()
			ball.position = position + $BreakBox.get_child(i).position
			ball.apply_impulse(Vector2(randi_range(-1000, -2000), randi_range(1000, -1000)))
			ball.new_size = ball_size
			
			Global.balls.append(ball)
			Global.balls_active += 1
			Global.scene.call_deferred("add_child", ball)
			ball.call_deferred("change_size")
