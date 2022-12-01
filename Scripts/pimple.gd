extends "Scroll_movement.gd"

var rnd_sprite = RandomNumberGenerator.new()

func _ready():
	rnd_sprite.randomize()
	$Sprite.frame_coords.y = rnd_sprite.randi_range(0,2)

func _physics_process(_delta):
	move()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_EffectDamage_body_entered(body):
	Global.camera.shake(50)
	Global.count += 1
	if Global.count >= 3:
		get_parent().get_parent().attack()
		Global.count = 0
	Global.slow_down()
	$AnimationPlayer.play("explosion")
	yield($AnimationPlayer,"animation_finished")
	queue_free()
