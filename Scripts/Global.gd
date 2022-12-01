extends Node


var camera = null
var Leg = null
var Player = null

var spider = false
var current_leg_scroll_speed:float
var coins = 0
var scroll_speed_spawner = 0.85
var scroll_speed_leg = -0.2
var count = 0
var k = 10
var current_score = 0
var best_score = [0]
var kf = 2 # 1 = common speed , 0.5 = + , 2 = -
 
func _ready():
	k = 10
	kf = 2
	pass

func reward_player(coin = 1):
	coins += coin

func slow_down(val = 0.3):
	scroll_speed_spawner = scroll_speed_spawner  - (scroll_speed_spawner * val)
	k = k - (k * val)
	kf = 2
	Player.slime = true
	yield(get_tree().create_timer(3.0,false), "timeout")
	Player.slime = false

func die():
	if !spider:
		Global.best_score.append(int(Global.current_score))
		Player.anim.play("die_common")
		RestartMenu.show()

func speed_up(val = 0.2):
	scroll_speed_spawner = scroll_speed_spawner  + (scroll_speed_spawner * val)
	k = 10/2
	kf = 0.5
