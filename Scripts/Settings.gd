extends CanvasLayer



func _ready():
	$Cont.hide()
	$ColorRect.hide()
	$TextureRect.hide()
	self.visible = false


func appear():
	$Cont.show()
	$ColorRect.show()
	$TextureRect.show()
	$AnimationPlayer.play("Appear")


func disappear():
	$AnimationPlayer.play("Disappear")
	yield($AnimationPlayer, "animation_finished")
	$Cont.hide()
	$ColorRect.hide()
	$TextureRect.hide()


func _on_Mainmenu_button_up():
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
	disappear()


func _on_White_button_up():
	if Global.coins >= 100:
		Global.coins -= 100
