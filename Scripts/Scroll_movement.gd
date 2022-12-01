extends Node2D


export var scroll_speed = 0.85

func set_scroll_speed(val):
	scroll_speed += val

func move():
	self.position.y += Global.scroll_speed_spawner
