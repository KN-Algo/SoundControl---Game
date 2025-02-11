extends Node


const WORLD = preload("res://Scenes/world.tscn")
const ETAP_1 = preload("res://Scenes/etap_1.tscn")

var spawn_door_tag

func go_to_level(level_tag, destination_tag):
	var scene_to_load
	
	match level_tag:
		"world":
			scene_to_load = WORLD
		"etap_1":
			scene_to_load = ETAP_1
	
	if scene_to_load != null:
		spawn_door_tag = destination_tag
		get_tree().change_scene_to_packed(scene_to_load)
