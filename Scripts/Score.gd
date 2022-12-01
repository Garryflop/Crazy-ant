extends Label

var score
var time = 0

func _physics_process(delta):
	time += (delta * 10) / Global.k
	score = "%05d"%[time]
	text = "Score:" + str(score)
	Global.current_score = score
