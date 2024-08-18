extends Button

signal begin_baking

func _on_button_down():
	print("button pressed")
	emit_signal("begin_baking")
	disabled = true
