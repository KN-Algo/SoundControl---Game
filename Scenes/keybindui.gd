extends Panel
@export var action:String
@onready var binds = $VBoxContainer/Binds
var is_listening=false
@onready var waiting = $Waiting
@onready var button = $"VBoxContainer/Button"

func _on_button_pressed():
	waiting.show()
	is_listening=true
	
func _ready():
	update_ui()
func update_ui():
	button.text=action
	waiting.hide()
	binds.text=""
	var events=InputMap.action_get_events(action)
	for index in range(events.size()):
		binds.text+=events[index].as_text()
		if events.size()>1 and index!=events.size()-1:
			binds.text+=", "
		
		
func _unhandled_input(event):
	if event is InputEventKey:
		if is_listening:
			if event.as_text()=="Backspace":
				InputMap.action_erase_events(action)
				update_ui()
				return
			if event.as_text()=="Escape":
				update_ui()
				return
			print(event.as_text())
			InputMap.action_add_event(action,event)
			if InputMap.action_get_events(action).size()>3:
				InputMap.action_erase_event(action,InputMap.action_get_events(action)[0])
			is_listening=false
	update_ui()
		
		
