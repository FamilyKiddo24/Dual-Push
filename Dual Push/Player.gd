extends KinematicBody2D
class_name RedPlayer

export(int) var SPEED = 135

var velocity = Vector2.ZERO
var is_moving = false

#----Detection Variables For Movement----#
var keep_right = false
var keep_left = false
var keep_forward = false
var keep_backwards = false

var can_move = true

var move_left = true
var move_right = true
var move_forward = true
var move_backwards = true
#----------------------------------------#

func _physics_process(delta):
	if can_move == true:
		if Input.is_action_pressed("forward"):
			rotation_degrees = 0
			resetMovement()
			velocity.y = -SPEED
		elif Input.is_action_pressed("backwards"):
			rotation_degrees = 180
			resetMovement()
			velocity.y = SPEED
		elif Input.is_action_pressed("left"):
			rotation_degrees = 270
			resetMovement()
			velocity.x = -SPEED	
		elif Input.is_action_pressed("right"):
			keep_right = true
			rotation_degrees = 90
			resetMovement()
			velocity.x = SPEED
	elif can_move == false:
		pass
			
	if Input.is_action_pressed("quit"):
		get_tree().quit()

	get_node("../Box").velocity_x = velocity.x
	get_node("../Box").velocity_y = velocity.y
	velocity = move_and_slide(velocity, Vector2.UP)


func resetMovement():
	velocity.x = 0
	velocity.y = 0

func _on_WallDetection_body_entered(body):
	if body.is_in_group("RedWalls"):
		can_move = true


func _on_WallDetection_body_exited(body):
	if body.is_in_group("RedWalls"):
		# Check if there are still any red walls in the area
		var bodies = $WallDetection.get_overlapping_bodies()
		can_move = false
		for other_body in bodies:
			if other_body.is_in_group("RedWalls"):
				can_move = true
				break
