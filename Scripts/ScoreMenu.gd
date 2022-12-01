extends Label

var score = Global.current_score

func _enter_tree():
	score = Global.current_score
	text = "BS:" + str(Global.best_score.max())
