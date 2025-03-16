extends Node


var time: float = 0.0
var milisecnods: float = 0
var secnods: float = 0
var minutes: float = 0


func _process(delta: float) -> void:
	time += delta
	milisecnods = fmod(time, 1) * 100
	secnods = fmod(time,60)
	minutes = fmod(time,3600) / 60
