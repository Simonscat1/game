extends Node2D

var current_scene = "world"
var change_scene = false

func _ready():
	pass

func _on_cave_body_entered(body):
	if body.is_in_group("Player"):
		change_scene = true
		change_scenes()

func change_scenes():
	if change_scene == true:
		if current_scene == "world":
			get_tree().change_scene_to_file("res://cave.tscn")
