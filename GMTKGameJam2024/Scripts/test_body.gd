extends Node2D

signal finish_baking

var expanding = false
var dragging = false
var mouse_within = false
var bake_over = false
var touching_pan = false
var offset = Vector2(0,0)

@onready var main = $".."

var score = 0

var score_number = preload("res://Scenes/score_number.tscn")

func _physics_process(_delta):
	if dragging:
		position = get_global_mouse_position() - offset
	if expanding == false && bake_over == false:
		if mouse_within == true:
			if Input.is_action_just_pressed("Select"):
				if dragging == false:
					print("Body selected")
					offset = get_global_mouse_position() - global_position
					dragging = true
				elif dragging == true:
					dragging = false
	if expanding == true:
		scale *= 1.001
		score += 1

func _on_area_2d_mouse_entered():
	print("Mouse entered")
	mouse_within = true

func _on_area_2d_mouse_exited():
	print("Mouse exited")
	mouse_within = false

func _on_bake_button_begin_baking():
	if touching_pan == false:
		expanding = true
	
func _on_area_2d_area_entered(_area):
	if expanding == false:
		touching_pan = true
		main.number_of_goods_not_touching_pan -= 1
	if expanding == true:
		expanding = false
		main.goods_touched()
		var number = showScore()
		number.set_value(str(score))
		bake_over = true
		main.total_score += score
		main.number_of_scores_calculated += 1

func _on_area_2d_area_exited(_area):
	touching_pan = false
	main.number_of_goods_not_touching_pan += 1

func showScore() -> ScoreNumber:
	var number = score_number.instantiate()
	add_child(number)
	number.global_position = global_position
	return number
