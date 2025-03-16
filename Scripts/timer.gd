extends Control

@onready var mins = $Panel/mins
@onready var secs = $Panel/secs
@onready var msecs = $Panel/msecs

func _process(_delta):
	msecs.text = "%02d" % GlobaTimer.milisecnods
	secs.text = "%02d:" % GlobaTimer.secnods
	mins.text = "%02d:" % GlobaTimer.minutes
