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
	if can_move:
		if Input.is_action_pressed("forward"):
			
			if move_forward:
				keep_forward = true
				rotation_degrees = 0
				resetMovement()
				velocity.y = -SPEED
			elif move_forward == false:
				pass
				
		elif Input.is_action_pressed("backwards"):
			
			if move_backwards:
				keep_backwards = true
				rotation_degrees = 180
				resetMovement()
				velocity.y = SPEED
			elif move_backwards == false:
				pass
				
		elif Input.is_action_pressed("left"):
			
			if move_left:	
				keep_left = true
				rotation_degrees = 270
				resetMovement()
				velocity.x = -SPEED
			elif move_left == false:
				pass
				
		elif Input.is_action_pressed("right"):
			
			if move_right:
				keep_right = true
				rotation_degrees = 90
				resetMovement()
				velocity.x = SPEED
			elif move_right == false:
				pass
			
		if Input.is_action_pressed("quit"):
			get_tree().quit()
	elif can_move == false:
		pass
		
	if keep_forward:
		resetMovement()
		velocity.y = -SPEED
	elif keep_forward == false:
		pass
	
	if keep_backwards:
		resetMovement()
		velocity.y = SPEED
	elif keep_backwards == false:
		pass
	
	if keep_left:
		resetMovement()
		velocity.x = -SPEED
	elif keep_left == false:
		pass
		
	if keep_right:
		resetMovement()
		velocity.x = SPEED
	elif keep_right == false:
		pass

	get_node("../Box").velocity_x = velocity.x
	get_node("../Box").velocity_y = velocity.y
	velocity = move_and_slide(velocity, Vector2.UP)


func resetMovement():
	velocity.x = 0
	velocity.y = 0

func turn_off_velocity():
	var keep_right = false
	var keep_left = false
	var keep_forward = false
	var keep_backwards = false

func move_anywhere_on():
	var move_left = true
	var move_right = true
	var move_forward = true
	var move_backwards = true
	
func move_anywhere_off():
	var move_left = false
	var move_right = false
	var move_forward = false
	var move_backwards = false

func _on_LeftEdge_body_entered(body):
	can_move = true
	move_anywhere_on()
	turn_off_velocity()

func _on_RightEdge_body_entered(body):
	can_move = true
	move_anywhere_on()
	turn_off_velocity()

func _on_BottomEdge_body_entered(body):
	can_move = true
	move_anywhere_on()
	turn_off_velocity()

func _on_TopEdge_body_entered(body):
	can_move = true
	move_anywhere_on()
	turn_off_velocity()

func _on_LeftEdge_body_exited(body):
	can_move = false
	move_anywhere_off()

func _on_RightEdge_body_exited(body):
	can_move = false
	move_anywhere_off()

func _on_TopEdge_body_exited(body):
	can_move = false
	move_anywhere_off()

func _on_BottomEdge_body_exited(body):
	can_move = false
	move_anywhere_off()
