extends Node
var can_change=false
var is_changing=false
var level_dict={"mainmenu":"res://Scenes/main_menu.tscn",
				"level0":"res://Scenes/world.tscn",
				"level1":"res://Scenes/level_1.tscn",
				"level2":"res://Scenes/level_2.tscn",
				"level3":"res://Scenes/level_3.tscn",
				"endscreen":"res://Scenes/end_screen.tscn",
				"settings":"res://Scenes/settings.tscn"}
var current_level="mainmenu"
var last_level="level1"
var entry=false
func _ready():
	await get_tree().create_timer(0.1).timeout
	can_change=true
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
		if level_name != "settings" and current_level != "settings":
			last_level = current_level
		if last_level == "endscreen":
			last_level = "level1"
		current_level=level_name
		can_change=true
	else:
		print("level not found")
		can_change=true
		

func restart():
	change_level(current_level)
