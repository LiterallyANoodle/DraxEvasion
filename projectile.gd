extends Area3D

var move: Vector3 = Vector3.ZERO
var speed: int = 2
var look_vector: Vector3 = Vector3.ZERO
var target: Node

func _physics_process(delta: float) -> void:
	move = Vector3.ZERO
	
	move = move.move_toward(target.global_position, delta)
	move = move.normalized() * speed
	global_position += move

func _on_visible_on_screen_notifier_3d_screen_exited() -> void:
	queue_free()
