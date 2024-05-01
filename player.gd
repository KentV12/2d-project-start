extends CharacterBody2D

signal health_depleted

var health = 100.0

func _physics_process(delta): # the update function
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * 600 # blue means a property of node
	move_and_slide()
	
	# get_node() is retrieving a path, the argument will be different if HappyBoo is a child of Collision2D
	if velocity.length() > 0.0:
		$HappyBoo.play_walk_animation()
	else:
		$HappyBoo.play_idle_animation()
		
	const DAMAGE_RATE = 10
	var overlapping_mobs = %HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		%HealthBar.value = health
		if health <= 0.0:
			health_depleted.emit() # send a signal to Game node and pause game
