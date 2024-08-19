extends AnimatableBody2D

var count = 0
var calls = ["play", "play_backwards"]

var speed = 8.00

# Called when the node enters the scene tree for the first time.
func _ready():
	$Swing.play("Swing")
	change_speed(randi_range(1, 12) + randf_range(0.00, 0.59))
	Global.pendulum_speed.connect(change_speed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_swing_animation_finished(anim_name):
	$Timer.start()
	count = wrapi(count + 1, 0, 2)


func _on_timer_timeout():
	$Swing.call_deferred(calls[count], "Swing")
	
func change_speed(speed):
	$Swing.speed_scale = speed
	print($Swing.speed_scale)
	$Swing.speed_scale /= 3


func _on_animation_player_animation_finished(anim_name):
	if anim_name == "Expand": $AnimationPlayer.play("Shrink")
