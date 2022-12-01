extends CanvasLayer

onready var score = $Control/MarginContainer/VBoxContainer/HBoxContainer/Score

func _ready():
	hide()

func _physics_process(delta):
	$Control/MarginContainer/VBoxContainer/HBoxContainer/Score.text = """YOUR
	SCORE:
	""" + str(Global.current_score)


func hide():
	$Control.hide()


func show():
	$Control.show()
	get_tree().paused = true


func _on_Restart_button_up():
	get_tree().paused = false
	get_tree().reload_current_scene()
	$Control.hide()


func _on_Quit_button_up():
	get_tree().paused = false
	$Control.hide()
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
