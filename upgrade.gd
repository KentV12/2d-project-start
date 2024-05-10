extends Area2D

func upgraded():
	queue_free()

func _on_body_entered(body):
	if body.has_method("upgraded"):
		body.upgraded()
		queue_free()
