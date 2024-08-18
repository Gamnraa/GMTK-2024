extends AnimatableBody2D
#0 = red, 1 = green, 2 = blue, 3 = yellow
@export var color: int
@export_file var sprite


# Called when the node enters the scene tree for the first time.
func _ready():
	if sprite != "" and sprite != null:
		$Sprite.texture = load(sprite)
		
	if color not in range(4): color = 0
	$Sprite.material.set_shader_parameter("color", color)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_animation_player_animation_finished(anim_name):
	print(anim_name)
	if anim_name == "Expand": $AnimationPlayer.play("Shrink")
