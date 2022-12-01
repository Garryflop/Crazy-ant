extends KinematicBody2D

onready var anim = $AnimationPlayer
var can_move = true
var speed = 112
var vel = Vector2()
var minX = 24
var maxX = 158
var slime = false setget slime

var move = true

func _ready():
	Global.Player = self
	global_position = Vector2(160,232)


func slime(x):
	slime = x
	if slime:
		$AnimationPlayer.play("run_slime")


func _input(event):
	if event.is_action_pressed("ui_accept") && can_move && move:
		if !slime:
			anim.play("middle_run")
		elif slime:
			anim.play("middle_run_slime")
		can_move = false
		scale.x = -1 if get_parent().state else 1
		if global_position.x != minX:
			get_parent().anim2.play("mid_run_r_l")
			yield(get_parent().anim2, "animation_finished")
			print(1)
		elif global_position.x != maxX:
			get_parent().anim2.play("mid_run_l_r")
			yield(get_parent().anim2, "animation_finished")
			print(2)
		can_move = true


func die():
	Global.best_score.append(int(Global.current_score))
	slime = false
	RestartMenu.show()


func beatle_coll():
	print("JDA")
	if !get_parent().state:
		get_parent().anim2.play("mid_run_l_r_rev")
	else:
		get_parent().anim2.play("mid_run_r_l_rev")
	yield(get_parent().anim2, "animation_finished")
	can_move = true


func center():
	self.visible = false
	set_collision_mask_bit(0,false)
	yield(get_tree().create_timer(1,false), "timeout")
	can_move = false
	yield(get_tree().create_timer(9.0, false), "timeout")
	set_collision_mask_bit(0,true)
	self.visible = true
	can_move = true
