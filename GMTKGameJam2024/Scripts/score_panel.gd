class_name ScorePanel

extends Control

@onready var score_number = $NinePatchRect/Score_Number

func _set_score(score:int):
	score_number = score
