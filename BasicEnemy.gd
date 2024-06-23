extends PathFollow3D

var health:int = 20
var speed:int = 1


func _ready() -> void:
	SignalBus.connect("DAMAGE_ENEMY", _take_damage)

func _physics_process(delta: float) -> void:
	progress += speed * delta 
	if progress_ratio >= 1.0:
		queue_free()

func _take_damage(damage: int) -> void:
	health -= damage
	if health <= 0:
		queue_free()
