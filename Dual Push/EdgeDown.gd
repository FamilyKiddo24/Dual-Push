extends Area2D

func _on_EdgeDown_body_entered(body):
	if body.is_in_group("RedPlayer"):
		get_node("../RedPlayer").touching_downEdge = true
	if body.is_in_group("RedBox"):
		get_node("../RedBox").touching_downEdge = true


func _on_EdgeDown_body_exited(body):
	if body.is_in_group("RedPlayer"):
		get_node("../RedPlayer").touching_downEdge = false
	if body.is_in_group("RedBox"):
		get_node("../RedBox").touching_downEdge = false
