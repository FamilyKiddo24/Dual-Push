extends Area2D

func _on_EdgeDownRight_body_entered(body):
	if body.is_in_group('RedPlayer'):
		get_node("../RedPlayer").force_move = true
	elif body.is_in_group('BluePlayer'):
		get_node("../BluePlayer").force_move = true


func _on_EdgeDownRight_body_exited(body):
	if body.is_in_group('RedPlayer'):
		get_node("../RedPlayer").force_move = false
	elif body.is_in_group('BluePlayer'):
		get_node("../BluePlayer").force_move = false
