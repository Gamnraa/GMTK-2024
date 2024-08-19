extends Node2D
var ball_obj = preload("res://Nodes/Ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Frog.get_node("ColorRect").rotation = -13
	$Frog.get_node("CollisionShape2D").rotation = -13


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
