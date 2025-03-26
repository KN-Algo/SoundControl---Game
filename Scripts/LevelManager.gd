extends Node
var can_change=true
var level_dict={"mainmenu":"res://Scenes/main_menu.tscn",
	"level1":"res://Scenes/world.tscn",
"level2":"res://Scenes/etap_1.tscn"}
var entry=true
func change_level(level_name):
	if !can_change:
		return
	can_change=false
	if level_dict.has(level_name):
		var level=level_dict[level_name]
		get_tree().call_deferred("change_scene_to_file",level)
	else:
		print("level not found")
	await get_tree().create_timer(0.1).timeout
	can_change=true
	
