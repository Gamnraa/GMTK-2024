extends AnimatableBody2D

@export var side: int = 0

var sides = ["L", "R"]
var next_anim = 1
var anims = ["Activate", "Deactivate"]

func _ready():
	$AnimationPlayer.play(anims[next_anim] + sides[side])


func _process(delta):
	pass


func _on_area_2d_area_entered(area):
	if area is RigidBody2D and not $AnimationPlayer.is_playing():
		print("activate paddle")
		$Timer.wait_time = randf_range(0.0, 1.0)
		$Timer.start()


func _on_timer_timeout():
	$AnimationPlayer.play(anims[next_anim] + sides[side])


func _on_animation_player_animation_finished(anim_name):
	if next_anim == 1:
		next_anim = 0
		$Timer.wait_time = randf_range(0.0, 2.0)
		$Timer.start()
