extends CanvasLayer


func _on_Settings_released():
	Settings.appear()


func _on_Play_released():
	get_tree().change_scene("res://Scenes/Main.tscn")


func _on_Quit_released():
	get_tree().quit()
