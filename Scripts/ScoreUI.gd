extends Control



func _on_Pause_Button_button_up():
	PauseMenu.set_visible(!get_tree().paused)
	get_tree().paused = !get_tree().paused



