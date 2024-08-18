class_name ScoreNumber

extends Node2D

signal score_added

@onready var label = $LabelContainer/Label
@onready var animation_player = $AnimationPlayer

func set_value(value:String):
	label.text = value
	animation_player.play("Score_rise_and_fade")
