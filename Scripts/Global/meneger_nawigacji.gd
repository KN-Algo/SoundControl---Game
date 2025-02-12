extends Node


const WORLD = preload("res://Scenes/world.tscn")
const ETAP_1 = preload("res://Scenes/etap_1.tscn")

signal on_trigger_player_spawn

var spawn_door_tag

func go_to_level(level_tag, destination_tag):
	var scene_to_load
	
	match level_tag:
		"world":
			scene_to_load = WORLD
		"etap_1":
			scene_to_load = ETAP_1
	
	if scene_to_load != null:
		ZmianaSceny.transition()
		await ZmianaSceny.on_transition_finished
		spawn_door_tag = destination_tag
		#get_tree().change_scene_to_packed(scene_to_load)
		get_tree().call_deferred("change_scene_to_packed",scene_to_load)
		
		

func trigger_player_spawn(position: Vector2):
	on_trigger_player_spawn.emit(position)
