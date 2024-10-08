extends Node

var ingame = true

var balls_left = 3
var balls_active = 1
var is_waiting_for_ball = true
var power = 0
var balls = []
var score = 0
var scene = null

signal red
signal green
signal blue
signal yellow

signal pendulum_speed

# Called when the node enters the scene tree for the first time.
func _ready():
	var root = get_tree().get_root()
	scene = get_tree().current_scene
	
	randomize()
	
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ingame:
		if balls_active < 1 and not is_waiting_for_ball:
			balls_left -= 1
			is_waiting_for_ball = true
		
		if balls_left == 0:
			ingame = false
			scene.get_node("Message").show()
			scene.get_node("Message").get_node("Txt").text = "Game Over! Final Score: " + str(score)
			await get_tree().create_timer(3.0).timeout
			scene.get_node("Message").hide()
			new_game()
		
		if Input.is_action_just_pressed("key_s"):
			red.emit()
		if Input.is_action_just_pressed("key_d"):
			green.emit()
		if Input.is_action_just_pressed("key_a"):
			blue.emit()
		if Input.is_action_just_pressed("key_w"):
			yellow.emit()
			
		if is_waiting_for_ball and Input.is_action_just_pressed("ui_accept"):
			power = Time.get_ticks_msec()
			scene.get_node("Space").get_node("Amt").text = "Release!"   
			
		if is_waiting_for_ball and Input.is_action_just_released("ui_accept"):
			print(Time.get_ticks_msec() - power)
			print(((Time.get_ticks_msec() - power)/1000 + 1))
			balls[0].launch(Vector2(0, max(-75000, -7500 * ((Time.get_ticks_msec() - power)/100 + 1))))
			scene.get_node("Space").get_node("Amt").text = "Hold Space"


func new_game():
	
	scene.queue_free()
	
	balls_left = 3
	balls_active = 1
	is_waiting_for_ball = true
	balls = []
	score = 0
	ingame = true
	#print(balls)
	get_tree().change_scene_to_file("res://Scenes/MadScienceLab.tscn")
	get_tree().reload_current_scene()
	#scene = get_tree().current_scene
	#print(balls)
	
	
