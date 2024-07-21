extends KinematicBody2D
class_name BluePlayer

export(int) var SPEED = 135

var velocity = Vector2.ZERO
var is_moving = false

func _physics_process(delta):
	
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


func resetMovement():
	velocity.x = 0
	velocity.y = 0
