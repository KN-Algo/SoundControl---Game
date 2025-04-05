extends Node
var can_change=true
var is_changing=false
var level_dict={"mainmenu":"res://Scenes/main_menu.tscn",
				"level0":"res://Scenes/world.tscn",
				"level1":"res://Scenes/level_1.tscn",
				"level2":"res://Scenes/level_2.tscn"}
var current_level="mainmenu"
var entry=false
func change_level(level_name):
	is_changing=true
	can_change=false
	if level_dict.has(level_name):
		var level=level_dict[level_name]
		SceneTransition.fade_in()
		await SceneTransition.faded_in
		get_tree().call_deferred("change_scene_to_file",level)
		SceneTransition.fade_out()
		await SceneTransition.faded_out
		is_changing=false
		current_level=level_name

	else:
		print("level not found")
	can_change=true

func restart():
	change_level(current_level)
