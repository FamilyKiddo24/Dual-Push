extends TextureButton

func _on_TextureButton_pressed():
	get_tree().reload_current_scene()
