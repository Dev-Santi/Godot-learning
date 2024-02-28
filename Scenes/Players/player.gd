extends Node2D

var speed:int = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#Movement
	var direction = Input.get_vector("left","right","up","down")
	position += direction * speed * delta
	
#Shooting
	if Input.is_action_pressed("primary action"):
		print("shoot laser")
	if Input.is_action_pressed("secondary action"):
		print("Throwing granade")