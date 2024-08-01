extends Area2D
class_name RedEndPoint

var timerTimeout = false

func _on_Area2D_body_entered(body):
	if body.is_in_group('RedBox'):
		if timerTimeout == false:
			timerTimeout = true
			startTimer(0.25)

func startTimer(time):
	$Timer.wait_time = time
	$Timer.start()
	
func _on_Timer_timeout():
	get_node("../RedPlayer").levelOver = true
