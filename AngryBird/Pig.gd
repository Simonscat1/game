extends RigidBody2D

var health = 150.0

func _ready():
	var t = Timer.new()
	t.set_wait_time(3)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	contact_monitor = true
	pass

func _on_Pig_body_entered(body):
	if is_instance_valid(body):
		if body is RigidBody2D:
			if body.is_in_group("Player"):
				queue_free()
			else:
				var damage = body.linear_velocity.length() * 20
				health -= damage
				print(health)
				if health <= 0:
					GameManager.Score += 1000
					queue_free()
	pass
