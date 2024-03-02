extends CharacterBody2D

signal shooting(start_position, direction)
signal throwing_grenade(position, direction)

var speed:int = 550
var can_shoot:bool = true
var can_use_grenade = true

func _process(_delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	
	#rotate
	look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("primary action") and can_shoot:
		can_shoot = false
		
		var posible_positions = $LaserStartPositions.get_children()
		var selected_position = posible_positions[randi() % posible_positions.size()]
		var bullet_direction = (get_global_mouse_position() - position).normalized()
		
		$GPUParticles2D.emitting = true
		
		shooting.emit(selected_position.global_position, bullet_direction)
		
		$Timer_shoot.start()
		
	if Input.is_action_pressed("secondary action") and can_use_grenade:
		can_use_grenade = false
		var grenade_position = $GrenadeStartPosition/Marker.global_position
		var grenade_direction = (get_global_mouse_position() - position).normalized()
		throwing_grenade.emit(grenade_position, grenade_direction)
		
		$Timer_grenade.start()


func _on_timer_grenade_timeout():
	can_use_grenade = true

func _on_timer_shoot_timeout():
	can_shoot = true
