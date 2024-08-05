extends Node2D

# --------- Stuff To-do --------- #
# 1) Add The Blue Side Area2d's For Detection (Done)
# 2) Change All Of The Detection Area2ds To The EdgeScripts.gd file (Done)
# 3) Delete Any Scripts That Are Not Needed
# ------------ Maybe ------------ #
# 4) Maybe Clean Up The Script For The Players
# 5) Maybe Make More Levels (for time)
# --------- 2024-07-31 ---------- #

# -- Level 1 Code --
var redLevelOver = false
var blueLevelOver = false

var debounce = false

func _physics_process(_delta):
	if redLevelOver and blueLevelOver:
		if debounce == false:
			debounce = true
			print('levelOver')
		elif debounce == true:
			pass
		
	if Input.is_action_pressed("quit"):
		get_tree().quit()
