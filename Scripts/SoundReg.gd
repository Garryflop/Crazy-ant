extends Control


func _ready():
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('Master'), $TextureRect/HSlider.value)


func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index('Master'), value)