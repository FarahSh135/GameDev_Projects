extends Node

signal lvlFinished
signal dies

var levels = ["res://level1.tscn", "res://level2.tscn", "res://level3.tscn"]
var currentlvl = 0
var currentLives = 3

func _ready() -> void:
	lvlFinished.connect(nextlvl)

func nextlvl() :
	if(currentlvl != 2):
		currentlvl += 1
		get_tree().change_scene_to_file.bind(levels[currentlvl]).call_deferred()
	else :
		get_tree().change_scene_to_file.bind("res://GameCleared.tscn").call_deferred()
