extends Control

var l  = "res://MainScene.tscn"

func _ready():
	pass # Replace with function body.



func _on_new_game_pressed():
	get_tree().change_scene(l)
