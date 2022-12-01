extends CanvasLayer



func _ready():
	set_visible(false)
	$Label.visible = false

func _input(event):
	if event.is_action_released('ui_cancel'):
		set_visible(!get_tree().paused)
		get_tree().paused = !get_tree().paused
		

func set_visible(is_visible):
#	for node in get_children():
#		node.visible = is_visible
	if !is_visible:
		$ColorRect.hide()
		$Control.hide()
	elif is_visible:
		$Control.show()
		$ColorRect.show()


func _on_Continue_button_up():
	set_visible(false)
	$Label.visible = true
	$AnimationPlayer.play("timer_out")
	yield($AnimationPlayer,"animation_finished")
	get_tree().paused = false
	$Label.visible = false
	

func _on_Restart_button_up():
	get_tree().reload_current_scene()
	set_visible(!get_tree().paused)
	get_tree().paused = !get_tree().paused
	


func _on_MainMenu_button_up():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	set_visible(!get_tree().paused)
	get_tree().paused = !get_tree().paused
	
