extends CanvasLayer


func _ready():
	$AnimationPlayer.play("In_Out")
	yield($AnimationPlayer,"animation_finished")
	get_tree().change_scene("res://Scenes/MainMenu.tscn")
