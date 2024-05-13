extends Area2D

var d := 0.0
var radius := 150
var speed := 20

func _physics_process(delta):
	d += delta
	
	position = Vector2(
		sin(d * speed) * radius,
		cos(d * speed) * radius
	)

func _on_body_entered(body):
	print("entering bodiess")
	if body.has_method("take_damage"):
		body.take_damage()
