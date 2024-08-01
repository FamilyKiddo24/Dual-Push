extends KinematicBody2D

var velocity = Vector2.ZERO
export(int) var SPEED = 135

var can_move = false

func _physics_process(delta):
	if can_move == true:
		print('on')
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
			rotation_degrees = 90
			resetMovement()
			velocity.x = SPEED
			
		if Input.is_action_pressed("quit"):
			get_tree().quit()
		
		velocity = move_and_slide(velocity, Vector2.UP)
	elif can_move == false:
		pass


func resetMovement():
	velocity.x = 0
	velocity.y = 0



func _on_Area2D_body_entered(body):
	can_move = true


func _on_Area2D_body_exited(body):
	can_move = false
