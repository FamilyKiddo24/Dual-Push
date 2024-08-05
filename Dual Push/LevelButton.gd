extends TextureButton

export(int) var level = 1
var scene_path = ""

export(bool) var locked = false

func _physics_process(_delta):
	if locked:
		disabled = true
		$Label.text = ''
	elif locked == false:
		disabled = false
		$Label.text = str(level)

func _on_LevelButton_pressed():
	if locked == false:
		scene_path = "res://Level" + str(level) + ".tscn"
		get_tree().change_scene(scene_path)
	elif locked == true:
		return
