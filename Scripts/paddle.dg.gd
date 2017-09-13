extends KinematicBody2D

const ball_asset = preload("res://Assets/ball.tscn")

func _ready():
	set_fixed_process(true)
	set_process_input(true)
	
func _fixed_process(delta):
	var y = get_pos().y
	var mouse_x = get_viewport().get_mouse_pos().x
	set_pos(Vector2(mouse_x, y))
	
func _input(event):
	if event.type == InputEvent.MOUSE_BUTTON && event.is_pressed():
		print("creation ball")
		var ball = ball_asset.instance()
		ball.set_pos(get_pos()-Vector2(0, 16))
		get_tree().get_root().add_child(ball)