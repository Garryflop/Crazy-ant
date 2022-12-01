extends "Scroll_movement.gd"

func _ready():
	$Sprite.frame = rand_range(0,8)


func _physics_process(delta):
	move()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
