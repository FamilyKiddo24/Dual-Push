extends Node

onready var RedPlayer = get_node('../RedPlayer')
onready var RedBox = get_node('../RedBox')

onready var BluePlayer = get_node('../BluePlayer')
onready var BlueBox = get_node('../BlueBox')

func onCollision(body, state):
	if body.is_in_group('RedPlayer'):
		
		if state == 'up':
			RedPlayer.touching_upEdge = true
		elif state == 'down':
			RedPlayer.touching_downEdge = true
		elif state == 'right':
			RedPlayer.touching_rightEdge = true
		elif state == 'left':
			RedPlayer.touching_leftEdge = true
		else:
			return
			
	elif body.is_in_group('RedBox'):
		
		if state == 'up':
			RedBox.touching_upEdge = true
		elif state == 'down':
			RedBox.touching_downEdge = true
		elif state == 'right':
			RedBox.touching_rightEdge = true
		elif state == 'left':
			RedBox.touching_leftEdge = true
		else:
			return
			
	elif body.is_in_group('BluePlayer'):
		
		if state == 'up':
			BluePlayer.touching_upEdge = true
		elif state == 'down':
			BluePlayer.touching_downEdge = true
		elif state == 'right':
			BluePlayer.touching_rightEdge = true
		elif state == 'left':
			BluePlayer.touching_leftEdge = true
		else:
			return
	
	elif body.is_in_group('BlueBox'):
		
		if state == 'up':
			BlueBox.touching_upEdge = true
		elif state == 'down':
			BlueBox.touching_downEdge = true
		elif state == 'right':
			BlueBox.touching_rightEdge = true
		elif state == 'left':
			BlueBox.touching_leftEdge = true
		else:
			return
			
	else:
		return
func offCollision(body, state):
	
	if body.is_in_group('RedPlayer'):
		
		if state == 'up':
			RedPlayer.touching_upEdge = false
		elif state == 'down':
			RedPlayer.touching_downEdge = false
		elif state == 'right':
			RedPlayer.touching_rightEdge = false
		elif state == 'left':
			RedPlayer.touching_leftEdge = false
		else:
			return
			
	elif body.is_in_group('RedBox'):
		
		if state == 'up':
			RedBox.touching_upEdge = false
		elif state == 'down':
			RedBox.touching_downEdge = false
		elif state == 'right':
			RedBox.touching_rightEdge = false
		elif state == 'left':
			RedBox.touching_leftEdge = false
		else:
			return
			
	elif body.is_in_group('BluePlayer'):
		
		if state == 'up':
			BluePlayer.touching_upEdge = false
		elif state == 'down':
			BluePlayer.touching_downEdge = false
		elif state == 'right':
			BluePlayer.touching_rightEdge = false
		elif state == 'left':
			BluePlayer.touching_leftEdge = false
		else:
			return
	
	elif body.is_in_group('BlueBox'):
		
		if state == 'up':
			BlueBox.touching_upEdge = false
		elif state == 'down':
			BlueBox.touching_downEdge = false
		elif state == 'right':
			BlueBox.touching_rightEdge = false
		elif state == 'left':
			BlueBox.touching_leftEdge = false
		else:
			return
			
	else:
		return

func forceMoveOn(body):
	if body.is_in_group('RedPlayer'):
		RedPlayer.force_move = true
	elif body.is_in_group('BluePlayer'):
		BluePlayer.force_move = true
	else:
		return
func forceMoveOff(body):
	
	if body.is_in_group('RedPlayer'):
		RedPlayer.force_move = false
	elif body.is_in_group('BluePlayer'):
		BluePlayer.force_move = false
	else:
		return

#------------------Level 1------------------------#
# Red Area2d's
func _on_EdgeLeft_body_entered(body):
	onCollision(body, 'left')
func _on_EdgeLeft_body_exited(body):
	offCollision(body, 'left')
func _on_EdgeRight_body_entered(body):
	onCollision(body, 'right')
func _on_EdgeRight_body_exited(body):
	offCollision(body, 'left')
func _on_EdgeUp_body_entered(body):
	onCollision(body, 'up')
func _on_EdgeUp_body_exited(body):
	offCollision(body, 'left')
func _on_EdgeDown_body_entered(body):
	onCollision(body, 'down')
func _on_EdgeDown_body_exited(body):
	offCollision(body, 'left')
func _on_EdgeDownLeft_body_entered(body):
	forceMoveOn(body)
func _on_EdgeDownLeft_body_exited(body):
	forceMoveOff(body)
func _on_EdgeDownRight_body_entered(body):
	forceMoveOn(body)
func _on_EdgeDownRight_body_exited(body):
	forceMoveOff(body)
func _on_EdgeTopRight_body_entered(body):
	forceMoveOn(body)
func _on_EdgeTopRight_body_exited(body):
	forceMoveOff(body)
func _on_EdgeTopLeft_body_entered(body):
	forceMoveOn(body)
func _on_EdgeTopLeft_body_exited(body):
	forceMoveOff(body)

# Blue Area2d's
func _on_EdgeLeft2_body_entered(body):
	onCollision(body, 'left')
func _on_EdgeLeft2_body_exited(body):
	offCollision(body, 'left')
func _on_EdgeRight2_body_entered(body):
	onCollision(body, 'right')
func _on_EdgeRight2_body_exited(body):
	offCollision(body, 'right')
func _on_EdgeUp2_body_entered(body):
	onCollision(body, 'up')
func _on_EdgeUp2_body_exited(body):
	offCollision(body, 'up')
func _on_EdgeDown2_body_entered(body):
	onCollision(body, 'down')
func _on_EdgeDown2_body_exited(body):
	offCollision(body, 'down')
func _on_EdgeDownLeft2_body_entered(body):
	forceMoveOn(body)
func _on_EdgeDownLeft2_body_exited(body):
	forceMoveOff(body)
func _on_EdgeDownRight2_body_entered(body):
	forceMoveOn(body)
func _on_EdgeDownRight2_body_exited(body):
	forceMoveOff(body)
func _on_EdgeTopRight2_body_entered(body):
	forceMoveOn(body)
func _on_EdgeTopRight2_body_exited(body):
	forceMoveOff(body)
func _on_EdgeTopLeft2_body_entered(body):
	forceMoveOn(body)
func _on_EdgeTopLeft2_body_exited(body):
	forceMoveOff(body)
#--------------------------------------------------#
