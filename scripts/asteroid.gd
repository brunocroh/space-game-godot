extends Node2D

var chosen = 0

func _ready():
	randomize()
	for a in $asteroids.get_children():
		a.visible = false

	chosen = randi() % $asteroids.get_child_count() + 1

	var node = get_node('asteroids/Asteroid-' + str(chosen))
	node.visible = true
	$area/shape.shape.radius = node.texture.get_width() / 2

func _on_Area2D_area_entered(area):
	queue_free()

