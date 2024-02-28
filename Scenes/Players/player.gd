extends CharacterBody2D

var speed:int = 400

func _ready():
	pass

func _process(delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	
	if Input.is_action_pressed("primary action"):
		print("shoot laser")
	if Input.is_action_pressed("secondary action"):
		print("Throwing granade")
