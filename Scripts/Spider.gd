extends CanvasLayer

onready var Ant = $Ant/Ant/CollisionShape2D
onready var anim = $Anim
var call = false
var state_machine
var state = false # left = false, right = true 

func _ready():
	state_machine = $AnimationTree.get("parameters/playback")
	$Ant.visible = false

func _on_Zona_body_entered(body):
	Ant.set_deferred("disabled", false)
	call = true
	Global.Player.move = false
	Global.camera.shake(100)
	$Ant.visible = true
	body.center()
	state_machine.travel("hold_long")
	Global.scroll_speed_spawner = 3
	Global.k = 10/3
	Global.kf = 0.5
	get_parent().on_spider = true
	yield(get_tree().create_timer(10.0, false), "timeout")
	Ant.set_deferred("disabled", true)
	Global.scroll_speed_spawner = 2.5
	call = false
	Global.Player.move = true
	state_machine.travel("Disappear2")
	$Ant.visible = false
	get_parent().spawn_mob = true
	get_parent().on_spider = false

func _input(event):
	if Input.is_action_pressed("ui_accept") && call:
		if !state:
			state_machine.travel("hold_l")
			yield(get_tree().create_timer(0.8,false), "timeout")
			state = true
		elif state:
			state_machine.travel("hold_r")
			yield(get_tree().create_timer(0.8,false), "timeout")
			state = false


func appear():
	state_machine.start("Appear")
	yield(get_tree().create_timer(3.0, false), "timeout")
	if !call:
		state_machine.travel("Disappear1")
