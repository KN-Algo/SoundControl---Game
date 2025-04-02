extends AudioStreamPlayer
@onready var timer = $Timer

var BPM=200
var tick=0
func _ready():
	var wait_time=60.0/BPM
	timer.wait_time=wait_time
	timer.start()
	while true:
		if(tick==0):
			pitch_scale=1.5
		else:
			pitch_scale=1.0
		tick+=1
		if(tick==4):
			tick=0
		play()
		print(Engine.get_process_frames())
		await timer.timeout
		
	
