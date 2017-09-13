extends RigidBody2D

const SPEED = 400 #test
const MAXSPEED = 30000

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.is_in_group("bricks"):
			body.queue_free()
			
		if body.get_name() == "Paddle":
			var speed = get_linear_velocity().length()
			var direction = get_pos() - body.get_node("Anchor").get_global_pos()
			var velocity = direction.normalized() * min(speed + SPEED * delta, MAXSPEED * delta)
			set_linear_velocity(velocity)
			
	if get_pos().y > get_viewport_rect().end.y:
		print("ball die")
		queue_free()