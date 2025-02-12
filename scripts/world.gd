extends Node2D



func  _ready() -> void:
	if MenegerNawigacji.spawn_door_tag != null:
		_on_level_spawn(MenegerNawigacji.spawn_door_tag)
		
func _on_level_spawn(destination_tag: String):
	var door = get_node(destination_tag) as Door
	MenegerNawigacji.trigger_player_spawn(door.spawn.global_position)
 
