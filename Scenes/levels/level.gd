extends Node2D

var laser_scene: PackedScene = preload("res://Scenes/Players/laser.tscn")
var grenade_scene: PackedScene = preload("res://Scenes/Players/grenade.tscn")

func _on_player_shooting(start_position, direction):
	var new_laser = laser_scene.instantiate() as Area2D
	new_laser.position = start_position
	new_laser.rotation = direction.angle()
	new_laser.direction = direction
	$Proyectiles.add_child(new_laser)

func _on_player_throwing_grenade(pos,direction):
	var new_grenade = grenade_scene.instantiate() as RigidBody2D
	new_grenade.position = pos
	new_grenade.linear_velocity = direction * new_grenade.speed
	$Proyectiles.add_child(new_grenade)


func _on_house_player_entered():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(1,1), 2)


func _on_house_player_exited():
	var tween = get_tree().create_tween()
	tween.tween_property($Player/Camera2D, "zoom", Vector2(0.6,0.6), 2)
