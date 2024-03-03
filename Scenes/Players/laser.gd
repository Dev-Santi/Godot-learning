extends Area2D

var speed:int = 800
var direction: Vector2 = Vector2.UP

func _ready():
	$Timer.start()

func _process(delta):
	position += direction * speed * delta

func _on_body_entered(body):
	if(body.has_method("hit")):
		body.hit()
	queue_free()

func _on_timer_timeout():
	queue_free()
