extends AnimatableBody2D

@export var side: int = 0

var sides = ["L", "R"]
var next_anim = 1
var calls = ["play", "play_backwards"]

func _ready():
	$AnimationPlayer.call_deferred(calls[next_anim], "Activate" + sides[side])



func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body is RigidBody2D and not $AnimationPlayer.is_playing():
		$Timer.wait_time = randf_range(0.05, 0.34)
		$Timer.start()


func _on_timer_timeout():
	$AnimationPlayer.call_deferred(calls[next_anim], "Activate" + sides[side])
	#$AnimationPlayer.play(anims[next_anim] + sides[side])


func _on_animation_player_animation_finished(anim_name):
	if next_anim == 0:
		next_anim = 1
		$Timer.wait_time = randf_range(0.0, .67)
		$Timer.start()
	else: next_anim = 0
	


