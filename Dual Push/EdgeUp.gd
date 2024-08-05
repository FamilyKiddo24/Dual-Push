extends Area2D

func _on_EdgeUp_body_entered(body):
	if body.is_in_group("RedPlayer"):
		get_node("../RedPlayer").touching_upEdge = true
	if body.is_in_group("RedBox"):
		get_node("../RedBox").touching_upEdge = true


func _on_EdgeUp_body_exited(body):
	if body.is_in_group("RedPlayer"):
		get_node("../RedPlayer").touching_upEdge = false
	if body.is_in_group("RedBox"):
		get_node("../RedBox").touching_upEdge = false
