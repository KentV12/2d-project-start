extends Area2D

var d := 0.0
var radius := 250.0
var speed := 2.0

func _physics_process(delta):
	d += delta
	
	position = Vector2(
		sin(d * speed) * radius,
		cos(d * speed) * radius
	)
	
