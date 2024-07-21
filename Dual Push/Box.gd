extends KinematicBody2D

var velocity = Vector2.ZERO
var velocity_x = 0
var velocity_y = 0

func _on_Area2D_body_entered(body):	
	velocity.x = velocity_x
	velocity.y = velocity_y
	
	print(velocity_x)
	print(velocity_y)
	
	move_and_slide(velocity)
