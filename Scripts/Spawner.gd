extends Node2D

export(Array, PackedScene) var scenes
export var timer1 :float = 2.0
export var timer2 :float = 3.0
export var time_exp = false
var rnd_time = RandomNumberGenerator.new()

var random_scene = RandomNumberGenerator.new()
var selected_scene_index = 0


func _process(_delta):
	rnd_time.randomize()
	$Timer.wait_time = rnd_time.randi_range(2/Global.scroll_speed_spawner,4/Global.scroll_speed_spawner)


func _on_Timer_timeout():
	random_scene.randomize()
	selected_scene_index = random_scene.randi_range(0, scenes.size() - 1)
	var tmp = scenes[selected_scene_index].instance()
	self.add_child_below_node(self, tmp)
	
