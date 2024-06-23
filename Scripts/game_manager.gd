extends Node

# code from https://www.youtube.com/watch?v=OWtwYp2lIlQ
func _input(event: InputEvent) -> void:
	if(event.is_action_pressed("ui_cancel")):
		var current_value: bool = get_tree().paused
		get_tree().paused = !current_value
