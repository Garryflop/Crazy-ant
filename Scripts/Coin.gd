extends "Scroll_movement.gd"

func _physics_process(delta):
	move()

func _on_PickUp_body_entered(body):
	if body.name == "Player":
		$AnimationPlayer.play("pickup")
		Global.reward_player()
		Global.speed_up(0.1)



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_PickUp_area_entered(area):
	if area.name == "Ant":
		$AnimationPlayer.play("pickup")
		yield($AnimationPlayer,"animation_finished")
		Global.reward_player()
		Global.speed_up(0.1)
		queue_free()
