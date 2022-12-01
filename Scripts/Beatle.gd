extends CanvasLayer


func appear():
	$AnimationPlayer.play("walk")
	yield($AnimationPlayer, "animation_finished")
	get_parent().spawn_mob = true

func _on_Zona_body_entered(body):
	body.beatle_coll()
