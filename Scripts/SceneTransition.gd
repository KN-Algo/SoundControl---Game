extends CanvasLayer
@onready var canvas_modulate = $CanvasModulate
signal faded_in
signal faded_out
var fade_time=0.25
func fade_in():
	canvas_modulate.modulate=Color(1,1,1,0)
	var tween=get_tree().create_tween()
	tween.tween_property(canvas_modulate,"modulate",Color(1,1,1,1),fade_time)
	await tween.finished
	faded_in.emit()
	
func fade_out():
	canvas_modulate.modulate=Color(1,1,1,1)
	var tween=get_tree().create_tween()
	tween.tween_property(canvas_modulate,"modulate",Color(1,1,1,0),fade_time)
	await tween.finished
	faded_out.emit()
