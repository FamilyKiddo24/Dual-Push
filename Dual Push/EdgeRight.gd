extends Area2D

func _on_EdgeRight_body_entered(body):
	if body.is_in_group("RedPlayer"):
		get_node("../RedPlayer").touching_rightEdge = true
	if body.is_in_group("RedBox"):
		get_node("../RedBox").touching_rightEdge = true


func _on_EdgeRight_body_exited(body):
	if body.is_in_group("RedPlayer"):
		get_node("../RedPlayer").touching_rightEdge = false
	if body.is_in_group("RedBox"):
		get_node("../RedBox").touching_rightEdge = false
