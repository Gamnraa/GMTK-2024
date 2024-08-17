extends Node

var ingame = false

var balls_left = 3
var balls_active = 1
var balls = []
var score = 0
var scene = null

signal red
signal green
signal blue
signal yellow

# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_tree().get_root()
	scene = root.get_child(0).duplicate()
	
	randomize()
	
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func new_game():
	
	for ball in balls: scene.remove_child(ball)
	
	scene.free()
	
	balls_left = 3
	balls_active = 1
	balls = []
	score = 0
	ingame = false
	
	get_tree().change_scene_to_file("res://Scenes/Debug.tscn")
	
