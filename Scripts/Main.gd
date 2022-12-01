extends Node2D

onready var Spider = $Spider
onready var Right = $Right
onready var Left = $Left
onready var anim = $AnimationPlayer
onready var anim2 = $AnimationPlayer2
var state = true #false = right, true = left
var time_attack = 0.3
var num:int
var spider = 50
var beatle = 70
var spawn_mob = true
var on_spider = false

func _ready():
	Global.scroll_speed_spawner = 0.85

func _process(delta):
	if int(Global.current_score) > spider and spawn_mob:
		spawn_mob = false
		$Spider.appear()
		spider += rand_range(50,100)
		print(Global.current_score)
		
	elif int(Global.current_score) > beatle and spawn_mob:
		spawn_mob = false
		$Beatle.appear()
		beatle += rand_range(90,150)
	
	if int(Global.current_score) == 55:
		$eventAnim.play("55")
	elif int(Global.current_score) == 300:
		$eventAnim.play("300")
	elif int(Global.current_score) == 555:
		$eventAnim.play("555")
	elif int(Global.current_score) == 1000:
		$eventAnim.play("1000")
	elif int(Global.current_score) == 1111:
		$eventAnim.play("1111")
	
func attack():
	num = 1 if state else 2
	anim.play("Warning")
	yield(anim,"animation_finished")
	match num:
		1:
			anim.play("Warn_left")
			yield(anim,"animation_finished")
			attack_left()
		2:
			anim.play("Warn_right")
			yield(anim,"animation_finished")
			attack_right()
	Global.camera.shake(100,1.5)


func attack_right():
	anim.play("Right")
	yield(get_tree().create_timer(time_attack), "timeout")
	if !state and !on_spider:
		Global.die()

func attack_left():
	anim.play("Left")
	yield(get_tree().create_timer(time_attack), "timeout")
	if state and !on_spider:
		Global.die()

func _input(event):
	if event.is_action_pressed("ui_up"):
		attack_right()
	if event.is_action_pressed("ui_down"):
		attack_left()
	if event.is_action_pressed("ui_left"):
		Spider.appear()
	if event.is_action_pressed("ui_right"):
		$Beatle.appear()


func _on_RightArea_body_entered(body):
	state = false
	if Global.Player.slime:
		Global.Player.anim.play("run_slime")
	elif !Global.Player.slime:
		Global.Player.anim.play("run")


func _on_LeftArea_body_entered(body):
	state = true
	if Global.Player.slime:
		Global.Player.anim.play("run_slime")
	elif !Global.Player.slime:
		Global.Player.anim.play("run")
