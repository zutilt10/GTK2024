extends Node2D

signal end_round

@onready var score_panel = $"Score Panel"
@onready var score_number = $"Score Panel/NinePatchRect/Score_Number"
@onready var bake_button = $BakeButton

@export var number_of_goods: int

var end = preload("res://Scenes/score_panel.tscn")

var number_of_goods_not_touching_pan = 0
var number_of_goods_finished_baking = 0
var number_of_scores_calculated = 0
var total_score = 0
var time_to_end_round = false
var baking = false

func _ready():
	number_of_goods_not_touching_pan = number_of_goods

func _physics_process(_delta):
	if baking == false:
		if number_of_goods_not_touching_pan != number_of_goods:
			bake_button.disabled = true
		elif number_of_goods_not_touching_pan == number_of_goods:
			bake_button.disabled = false
	if time_to_end_round == false:
		if number_of_scores_calculated == number_of_goods:
			print("All goods finished baking")
			time_to_end_round = true
			await get_tree().create_timer(3.0).timeout
			score_panel.visible = true
			score_number.text = str(total_score)

func goods_touched():
	number_of_goods_finished_baking += 1
	if number_of_goods_finished_baking == number_of_goods:
		emit_signal("end_round")

func _on_bake_button_begin_baking():
	baking = true
