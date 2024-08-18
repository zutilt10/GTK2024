extends Button

var body_to_load = preload("res://Scenes/test_body.tscn")

func _on_button_down():
	print("button pressed")
	var body = body_to_load.instantiate()
	body.position = position
	add_child(body)
