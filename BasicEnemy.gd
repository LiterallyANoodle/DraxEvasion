extends PathFollow3D

var health:int = 5
var speed:int = 1

func _physics_process(delta: float) -> void:
	progress += speed * delta 
	if progress > 10000:
		queue_free()
