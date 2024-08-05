extends Area2D

func _on_Spikes_body_entered(body):
	if body.is_in_group('Box') or body.is_in_group('Players'):
		get_tree().reload_current_scene()
