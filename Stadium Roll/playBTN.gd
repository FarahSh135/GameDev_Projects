extends Button

func _on_pressed() -> void:
	Eventbus.currentlvl=0
	Eventbus.currentLives=3
	get_tree().change_scene_to_file.bind("res://level1.tscn").call_deferred()
