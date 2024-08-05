extends KinematicBody2D
class_name RedPlayer
# 135
export(int) var SPEED = 200
onready var level = get_node("../../Level1")

var levelOver = false

var velocity = Vector2.ZERO
var is_moving = false

var timer_timeout = false

var num_of_walls = 0

var force_move = false

var velocity_x = 0
var velocity_y = 0

var overlapping_bodies = []

var wallbody = null

#----Detection Variables For Movement----#
var boxTouchingWall = false

var touching_upEdge = false
var touching_downEdge = false
var touching_leftEdge = false
var touching_rightEdge = false

export(bool) var can_move = true

var check_left = false
var check_right = false
var check_forward = false
var check_backwards = false
#----------------------------------------#

func _physics_process(_delta):
	if check_forward:
		can_move = false
		if touching_upEdge:
			touching_upEdge = false
			can_move = true
			resetCollision()

	if check_backwards:
		can_move = false
		if touching_downEdge:
			touching_downEdge = false
			can_move = true
			resetCollision()
			
	if check_left:
		can_move = false
		if touching_leftEdge:
			touching_leftEdge = false
			can_move = true
			resetCollision()

	if check_right:
		can_move = false
		if touching_rightEdge:
			touching_rightEdge = false
			can_move = true
			resetCollision()

	if levelOver == false:
		if can_move == true or force_move == true:
			if timer_timeout == false:
				if Input.is_action_pressed("forward"):
					if touching_upEdge:
						resetMovement()
						return
					elif touching_upEdge == false:
						rotation_degrees = 0
						resetMovement()
						velocity_y = -SPEED
						resetCollision()
						check_forward = true
				elif Input.is_action_pressed("backwards"):
					if touching_downEdge:
						resetMovement()
						return
					elif touching_downEdge == false:
						rotation_degrees = 180
						resetMovement()
						velocity_y = SPEED
						resetCollision()
						check_backwards = true
				elif Input.is_action_pressed("left"):
					if touching_leftEdge:
						resetMovement()
						return
					elif touching_leftEdge == false:
						rotation_degrees = 270
						resetMovement()
						velocity_x = -SPEED
						resetCollision()
						check_left = true
				elif Input.is_action_pressed("right"):
					if touching_rightEdge:
						resetMovement()
						return
					elif touching_rightEdge == false:
						rotation_degrees = 90
						resetMovement()
						velocity_x = SPEED
						resetCollision()
						check_right = true
		elif can_move == false:
			pass
	elif levelOver == true:
		pass


	get_node("../RedBox").velocity_x = velocity_x
	get_node("../RedBox").velocity_y = velocity_y
	
	velocity.x = velocity_x
	velocity.y = velocity_y
	
	level.redLevelOver = levelOver
	
	velocity = move_and_slide(velocity, Vector2.UP)


func resetMovement():
	velocity_x = 0
	velocity_y = 0

func debug_velocity():
	print('Target/Real Velocity (x,y)')
	print(velocity_x)
	print(velocity.x)
	print('--------y-------')
	print(velocity_y)
	print(velocity.y)
	print('----------------')

func resetCollision():
	check_forward = false
	check_backwards = false
	check_left = false
	check_right = false

func debugCollision():
	print('Collision Debug')
	print('Up: ', check_forward)
	print('Down: ', check_backwards)
	print('Right: ', check_right)
	print('Left: ', check_left)
	print('---------------')
