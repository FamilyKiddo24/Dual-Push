extends KinematicBody2D
class_name RedBox

var touching_upEdge = false
var touching_downEdge = false
var touching_leftEdge = false
var touching_rightEdge = false

var velocity = Vector2.ZERO
var velocity_x = 0
var velocity_y = 0

func _on_Area2D_body_entered(body):
	if body.is_in_group("RedPlayer"):
		if touching_upEdge:
			get_node("../RedPlayer").touching_upEdge = true
		if touching_downEdge:
			get_node("../RedPlayer").touching_downEdge = true
		if touching_leftEdge:
			get_node("../RedPlayer").touching_leftEdge = true
		velocity.x = velocity_x
		velocity.y = velocity_y
			
		velocity = move_and_slide(velocity, Vector2.UP)

	
		
