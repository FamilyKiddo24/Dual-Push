extends Area2D

func _on_EdgeLeft_body_entered(body):
	if body.is_in_group("RedPlayer"):
		#get_node("../RedPlayer").touching_leftEdge = true
		get_node("../RedPlayer").can_move = true
	if body.is_in_group("RedBox"):
		get_node("../RedBox").touching_leftEdge = true


func _on_EdgeLeft_body_exited(body):
	if body.is_in_group("RedPlayer"):
		#get_node("../RedPlayer").touching_leftEdge = false
		get_node("../RedPlayer").can_move = false
	if body.is_in_group("RedBox"):
		get_node("../RedBox").touching_leftEdge = false


func _on_EdgeLeft2_body_entered(body):
	pass # Replace with function body.
