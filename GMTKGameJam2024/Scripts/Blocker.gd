extends Area2D

signal end_baking

func _on_area_entered(_area):
	print("Goods hit the tin")
	emit_signal("end_baking")
